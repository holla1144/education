print "Hello! Please enter a celsius value: "
celsius = gets
fahrenheit = (celsius.to_i * 9 / 5) + 32
puts "Saving the result of our calculation to 'Temp.out'"
fh = File.new('Temp.out', 'w')
fh.puts fahrenheit
fh.close