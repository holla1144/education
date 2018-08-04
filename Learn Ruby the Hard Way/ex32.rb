hairs = ['brown', 'blond', 'red'] # array of string
eyes = ['brown', 'blue', 'green'] # array of string
weights = [1, 2, 3, 4] # array of int

the_count = [1, 2, 3, 4, 5] # array of int
fruits = ['apples', 'oranges', 'pears', 'apricots'] # array of string
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']  # array of string and int

# this first kind of for-loop goes through a list
# in a more traditional style found in other languages

the_count.each do |number|
  puts "This is count #{number}"
end

# same as above, but in a more ruby style
# this and the next one are the preferred
# way Ruby for loops are written

fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

# also we can go through mixed lists too
# note this is yet another style, exactly like above
# but a different syntax (way to write it).

change.each {|i| puts "I got #{i}"}

# we can also build lists. First start with an empty one

elements = []

# then use the range operator to do 0 to 5 counts
(0..5).each do |i| # range operator with two .. is inclusive of last digit. Range operator with three ... is exclusive of last argument
  puts "adding #{i} to the list."
  # pushes the i variable on the *end* of the list
  elements << i # << is the same as push
end

# now we can print them out too
elements.each{|i| puts "Element was: #{i}"}