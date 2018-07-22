# Useful read/write commands
# close - Closes the file. Like File->Save in a text editor
# read - Reads the contents of a file. You can assign the result to a variable.
# readline - Reads just one line of a text file
# truncate - Empties a file. Be careful when using this method
# write('Stuff') - Writes 'Stuff' to the file
# seek(0) - move the read/write location to the beginning of the file. 

filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

puts "Opening the file..."   # opening a filename that doesn't exist creates that file
target = open(filename, 'w') # opening the file with the 'write' parameter

puts "Truncating the file. Goodbye!"
target.truncate(0) # Specifying a location for the write operation to start

# Using truncate here is unecessary. By default, .write() truncates the contents of a file.
puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these lines to the file."

target.write("#{line1 + "\n" + line2 + "\n" + line3 + "\n"}")

puts "And finally, we close it."
target.close








