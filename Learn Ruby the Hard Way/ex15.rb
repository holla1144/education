filename = ARGV.first # get filename

# creates a file object and assigns it to the variable txt
txt = open(filename)

# prints the name of the file the user entered as a command line argument
puts "Here's your file #{filename}:"

# reads the contents of the file assigned to the variable txt
print txt.read

txt.close()

# prints a message to the user
print "Type the filename again: "

# receives input from the user and assigns it to the variable file_again
file_again = $stdin.gets.chomp

# creates a file object and assigns it to the variable txt_again
txt_again = open(filename)

# reads the contents of the file assigned to txt_again
print txt_again.read

txt_again.close()