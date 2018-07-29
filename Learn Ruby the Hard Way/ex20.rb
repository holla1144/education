input_file = ARGV.first # Get file name as command line argument

# Define a function that prints the contents of a file
def print_all(f)
    puts f.read
end

# Define a function that takes a file and rewinds to the beginning
def rewind(f)
    f.seek(0)
end

# Prints a line number, and reads one line of a file
def print_a_line(line_count, f)
    puts "#{line_count}, #{f.gets.chomp}"
end

# opens input file, creating a file object that can be read
current_file = open(input_file)

puts "First let's print the whole file:\n"

# Calls print_all on the current file
print_all(current_file)

puts "Now let's rewind, kind of like a tape."

# Call rewind on the current file
rewind(current_file)

puts "Let's print three lines:"

# Sets current line to 1
current_line = 1

# Prints the first line from current_file
print_a_line(current_line, current_file)

# Sets value of current_line to 2
current_line += 1

# Prints second line from current_file
print_a_line(current_line, current_file)

# Sets value of current_line to 3
current_line += 1

# Prints third line of the current
print_a_line(current_line, current_file)

