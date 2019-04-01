(ns pegthing.core
  (:require [clojure.set :as set])
  (:gen-class))

(def lemon "test")

(declare successful-move prompt-move game-over query-rows prompt-empty-peg)

(defn tri*
  "Generates a lazy sequence of triangular numbers.
   Triangular numbers are created by adding the first n natural numbers together.
   The third number is 1 + 2 + 3, etc."
  ([] (tri* 0 1))
  ([sum n]
   (let [new-sum (+ sum n)]
     (cons new-sum (lazy-seq (tri* new-sum (inc n)))))))

(def tri (tri*))

(defn triangular? 
  "Returns true if n is triangular (i.e. 1, 3, 6, 10, 15)"
  [n]
  (= n (last (take-while #(>= n %) tri))))

(defn row-tri
  "Returns number at the end of row"
  [n]
  (last (take n tri)))

(defn row-num
  "Takes a position and returns the number of 
   the row in which that position is found."
  [pos]
  (inc (count (take-while #(> pos %) tri))))

(defn connect
  "Form a mutual connection between two positions"
  [board max-pos pos neighbor destination]
  (if (<= destination max-pos)
    (reduce (fn [new-board [p1 p2]]
              (assoc-in new-board [p1 :connections p2] neighbor))
              board
              [[pos destination] [destination pos]])
    board))

(defn connect-right
  [board max-pos pos]
  (let [neighbor (inc pos)
        destination (inc neighbor)]
    (if-not (or (triangular? neighbor) (triangular? pos))
      (connect board max-pos pos neighbor destination)
      board)))

(defn connect-down-left
  [board max-pos pos]
  (let [row (row-num pos)
        neighbor (+ row pos)
        destination (+ 1 row neighbor)]
    (connect board max-pos pos neighbor destination)))

(defn connect-down-right
  [board max-pos pos]
  (let [row (row-num pos)
        neighbor (+ 1 row pos)
        destination (+ 2 row neighbor)]
    (connect board max-pos pos neighbor destination)))

(defn add-pos
  "Pegs the position and performs connections"
  [board max-pos pos]
  (let [pegged-board (assoc-in board [pos :pegged] true)]
    (reduce (fn [new-board connection-creation-fn]
              (connection-creation-fn new-board max-pos pos))
            pegged-board
            [connect-right connect-down-left connect-down-right])))

(defn new-board
  "Creates a new board with the given number of rows"
  [rows]
  (let [initial-board {:rows rows}
        max-pos (row-tri rows)]
    (reduce (fn [board pos] (add-pos board max-pos pos))
            initial-board
            (range 1 (inc max-pos)))))

;; Moving pegs

(defn pegged? 
  "Does the position have a peg in it?"
  [board pos]
  (get-in board [pos :pegged]))

(defn remove-peg
  "Take the peg at a given position out of the board"
  [board pos]
  (assoc-in board [pos :pegged] false))

(defn place-peg
  "Put a peg in the board at a given position"
  [board pos]
  (assoc-in board [pos :pegged] true))

(defn move-peg
  "Take peg out of p1 and place it in p2"
  [board p1 p2]
  (place-peg (remove-peg board p1) p2))

(defn valid-moves
  "Return a map of all valid moves for pos, where the key is the
   destination and the value is the jumped position"
  [board pos]
  (into {}
        (filter (fn [[destination jumped]]
                  (and (not (pegged? board destination))
                       (pegged? board jumped)))
                (get-in board [pos :connections]))))

(defn valid-move?
  "Return jumped position if the move from p1 to p2 is valid, nil otherwise"
  [board p1 p2]
  (get (valid-moves board p1) p2))

;; if-let binds a value if the supplied predicate is truthy. If no else clause is supplied, nil is returned if predicate is falsey.
(defn make-move
  "Move peg from p1 to p2, removing jumped peg"
  [board p1 p2]
  (if-let [jumped (valid-move? board p1 p2)]
    (move-peg (remove-peg board jumped) p1 p2)))

(defn can-move?
  "Do any of the pegged positions have valid moves?"
  [board]
  (some (comp not-empty (partial valid-moves board))
        (map first (filter #(get (second %) :pegged) board))))

;; Rendering and printing a board

(def alpha-start 97)
(def alpha-end 123)
(def letters (map (comp str char) (range alpha-start alpha-end)))
(def pos-chars 3)

(def ansi-styles
  {:red "[31m"
   :green "[32m"
   :blue "[34m"
   :reset "[0m"})

(defn ansi
  "Produce a string which will apply an ansi style"
  [style]
  (str \u001b (style ansi-styles)))

(defn colorize 
  "Apply ansi color to text"
  [text color]
  (str (ansi color) text (ansi :reset)))

(defn render-pos
  [board pos]
  (str (nth letters (dec pos))
       (if (get-in board [pos :pegged])
         (colorize "0" :blue)
         (colorize "-" :red))))

(defn row-positions
  "Return all the positions in the given row"
  [row-num]
  (range (inc (or (row-tri (dec row-num)) 0))
         (inc (row-tri row-num))))

(defn row-padding
  "String of spaces to add to to the beginning of a row to center it"
  [row-num rows]
  (let [pad-length (/ (* (- rows row-num) pos-chars) 2)]
    (apply str (take pad-length (repeat " ")))))

(defn render-row
  [board row-num]
  (str (row-padding row-num (:rows board))
       (clojure.string/join " " (map (partial render-pos board)
                                     (row-positions row-num)))))

;; doseq is used when you want to perform side-effecting operations on a collection
;; the vector following doseq describes how to bind all the elements in the collection to a name
;; so that you can operate on them. 

(defn print-board
  [board]
  (doseq [row-num (range 1 (inc (:rows board)))]
    (println (render-row board row-num))))

;; Player interaction

(defn letter->pos 
  "Converts a letter string to the corresponding position number"
  [letter]
  (inc (- (int (first letter)) alpha-start)))

(defn get-input
  "Waits for user to enter text and hit enter, then cleans the input"
  ([] (get-input nil))
  ([default]
   (let [input (clojure.string/trim (read-line))]
     (if (empty? input)
       default
       (clojure.string/lower-case input)))))

(defn characters-as-strings
  "Takes in a string and removes all nonalphabetic input"
  [string]
  (clojure.string/split (clojure.string/replace string #" " "") #""))

(defn user-entered-invalid-move
  "Handles the next step after a user has entered an invalid move"
  [board]
  (println "\n!!! That was an invalid move :(\n)")
  (prompt-move board))

(defn user-entered-valid-move
  "Handles the next step after a user has entered a valid move"
  [board]
  (if (can-move? board)
    (prompt-move board)
    (game-over board)))

(defn prompt-move
  [board]
  (println "\nHere's your board:")
  (print-board board)
  (println "Move from where to where? Enter two letters:")
  (let [input (map letter->pos (characters-as-strings (get-input)))]
    (if-let [new-board (make-move board (first input) (second input))]
      (user-entered-valid-move new-board)
      (user-entered-invalid-move board))))

(defn prompt-rows
  []
  (println "how many rows? [5]")
  (let [rows (Integer. (get-input 5))
        board (new-board rows)]
    (prompt-empty-peg board)))

(defn game-over
  "Announce the game is over and prompt to play again"
  [board]
  (let [remaining-pegs (count (filter :pegged (vals board)))]
    (println "Game over! You had" remaining-pegs "pegs left:")
    (print-board board)
    (println "Play again? y/n [y]")
    (let [input (get-input "y")]
      (if (= "y" input)
        (prompt-rows)
        (do 
          (println "Bye!")
          (System/exit 0))))))

(defn prompt-empty-peg
  [board]
  (println "Here's your board:")
  (print-board board)
  (println "Remove which peg? [e]")
  (prompt-move (remove-peg board (letter->pos (get-input "e")))))

;; Exercises

;; 1. You used (comp :intelligence :attributes) to create a function that returns a character’s intelligence. 
;; Create a new function, attr, that you can call like (attr :intelligence) and that does the same thing.

(def character
  {:name "Smooches McCutes"
   :attributes {:intelligence 10
                :strength 4
                :dexterity 5}})

(defn attr 
  "Gets keyword attribute from a character"
  [attribute-name]
  ((character :attributes) attribute-name))

;; 2. Implement the comp function.

(defn new-comp
  [& funcs]
  (fn [& args]
    (let [to-apply (reverse funcs)
          starter-result (apply (first to-apply) args)]
      (loop [iter-arr to-apply
             result starter-result]
        (if (empty? (rest iter-arr))
          result
          (recur (rest to-apply)
                 ((first (rest to-apply)) result)))))))

;; Implement the assoc-in function. Hint: use the assoc function and define its parameters as [m [k & ks] v].

;; example: (assoc-in {} [:cookie :monster :vocals] "Finntroll") yields {:cookie {:monster {:vocals "Finntroll"}}}

(defn new-assoc-in
  "Clone of assoc-in"
  [map arr-of-fields value]
  (let [fields (reverse arr-of-fields)
        deepest-assoc (assoc {} (first fields) value)]
    (loop [iter (rest fields)
           result deepest-assoc]
      (if (empty? (rest iter))
        (assoc map (first iter) result)
        (recur (rest iter) (assoc {} (first iter) result))))))

;; 3. implement update-in 
;; ex. (def users [{:name "James" :age 26}  {:name "John" :age 43}]) 
;;     (update-in users [1 :age] inc) yields [{:name "James", :age 26} {:name "John", :age 44}]

(defn new-update-in
  [map keys func & args]
  (let [val (get-in map keys)
        updater-func (fn ([] (func val))
                         ([args] (apply func val args)))
        updated-val (updater-func args)
        ]
    (assoc-in map keys updated-val)))

(def test "lemon")

;; Test (1 + 3 * 4 - 5) should equal (- (+ 1 (* 3 4)) 5)

(def test-form '(1 + 3 * 4 - 5))

(def operators #{/ * + -})

(defn is-operator? [x] (contains? operators x))

(def op-prior {
               / 1
               * 1
               + 0
               - 0
               })

(defn infix
  "Convert a form to use infix notation. Returns valid list"
  [infix-form]
  

