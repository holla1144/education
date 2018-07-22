def cheese_and_crackers(cheese_count, boxes_of_crackers)
    puts "You have #{cheese_count} cheeses!"
    puts "You have #{boxes_of_crackers} boxes of crackers!"
    puts "Man that's enough for a party!"
    puts "Get a blanket. \n"
end

puts "We can just give the function numbers directly:"
cheese_and_crackers(20, 30)

puts "OR, we can use variables from our script:"
amount_of_cheese = 10
amount_of_crackers = 50

cheese_and_crackers(amount_of_cheese, amount_of_crackers)

puts "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)

puts "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)

def add_some_stuff_together(thing1, thing2)
    puts "#{thing1 + thing2}"
end

add_some_stuff_together(1, 2)

varA = 200
varB = 8

add_some_stuff_together(varA, varB)

print "What is your first number?"
number1 = gets.chomp.to_i
print "What is your second number?"
number2 = gets.chomp.to_i

puts "Your total is #{add_some_stuff_together(number1, number2)}"
