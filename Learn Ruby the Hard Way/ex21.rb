def add(a, b)
    puts "Adding #{a} + #{b}"
    a + b
end

def subtract(a, b)
    puts "Subtracting #{a} - #{b}"
    a - b
end

def multiply(a, b)
    puts "Multiplying #{a} * #{b}"
    a * b   
end

def divide(a, b)
    puts "Dividing #{a} / #{b}"
    a / b    
end

puts "Let's do some mate with just functions!"

age = add(30, 5)
height = subtract(78, 4)
weight = multiply(90, 2)
iq = divide(100, 2)

puts "Age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}"

# A puzzle for extra credit, type it in anyway.
puts "Here's a puzzle."

# - 4391?

# 35 + (74 - (180 * 25)
what = add(age, subtract(height, multiply(weight, divide(iq, 2))))\

puts "That becomes: #{what}. Can you do it by hand?"