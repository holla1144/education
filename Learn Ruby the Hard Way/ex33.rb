def count_to_num(number, interval)
  numbers = []
  (1..number).each do |num|
    numbers << num
  end
  puts numbers
end

# puts "The numbers: "

# remember you can write this 2 other ways

# numbers.each {|num| puts num}

count_to_num(100, 20)