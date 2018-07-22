# declares variable typs_of_people with the value 10
types_of_people = 10

# declares the variable x as a string which includes types_of_people 
x = "There are #{types_of_people} types of people."

# declares variable binary and sets it to the string binary
binary = "binary"

# declares variable do_not and sets it as the string don't
do_not = "don't"

# declares a variable y and sets it to a string (1, 2)
y = "Those who know #{binary} and those who #{do_not}."

puts x
puts y

# (3)
puts "I said: #{x}"

# (4) 
puts "I also said: '#{y}'."

hilarious = false
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

puts joke_evaluation
w = "This is just the left side of ..."
e = "a string with a right side."

puts w + e