# # Print puts a text on the screen without a new line

# print "How old are you? "
# # gets asks for user input. chomp removes whitespace
# age = gets.chomp
# print "How tall are you? "
# height = gets.chomp
# print "How much do you weigh? "
# weight = gets.chomp

# puts "So, you're #{age} old, #{height} tall, and #{weight} heavy."

print "What time is it? "
time_now = gets.chomp.to_i
print "Do you know what time it will be in 6 hours? "
time_plus_six = gets.chomp.to_i

print "You are #{time_plus_six === time_now + 6 }"