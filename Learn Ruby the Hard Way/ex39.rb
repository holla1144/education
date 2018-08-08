# Comparison of array to has table

# Arrays

things = ['a', 'b', 'c', 'd']
puts things[1]

things[1] = 'z'

puts things[1] # 'b'

puts things # ['a', 'z', 'c', 'd']

# Arrays let you get retrieve items using an index, but hash tables let you use any type of data as a key to a given value

stuff = {'name' => 'Zed', 'age' => 39, 'height' => 6 * 12 + 2}

puts stuff['name'] # zed

puts stuff['age'] # 39

puts stuff['height'] # 74

stuff['city'] = 'San Francisco'

print stuff['city'] # 'San Francisco'

# the keys in a hash can be of any type, not just string

stuff[1] = 'Wow'
stuff[2] = 'Neato'

puts stuff[1] = 'Wow'
puts stuff[2] = 'Neato'

puts stuff # {'name' => 'Zed', 'age' => 39, 'height' => 74, 'city' => 'San Francisco', 1 => 'Wow', 2 => 'Neato'}

# you can delete stuff from a has using the delete keyword

stuff.delete('city')

stuff.delete(1)

stuff.delete(2)

puts stuff # {'name' => 'Zed', 'age' => 39, 'height' => 74}

# create a mapping of state to abbreviation

states = {
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'New York' => 'NY',
  'Michigan' => 'MI',
  'Dnipropetrovsk' => 'DP'
}

# create a basic set of states and some cities in them

cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville',
  'DP' => 'Dnipro'
}

cities.default = "Sorry, we couldn't find what you are looking for."

# add some more cities to our cities hash

cities['NY'] = 'New York'
cities['OR'] = 'Portland'

# puts out some cities

puts '-' * 10
puts "NY State has: #{cities['NY']}" # puts New York
puts "OR State has: #{cities['OR']}" # puts Portland

# puts some states

puts '-' * 10
puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{states['Florida']}"

# do it by using the state then the cities dict
puts '-' * 10
puts "Michigan has #{cities[states['Michigan']]}"
puts "Florida has #{cities[states['Florida']]}"

# puts every state abbreaviation

puts '-' * 10
states.each do |state, abbreviation| # each works on hashes too!
  puts "#{state} is abbreviated #{abbreviation}"
end

# puts every city in state

puts '-' * 10
cities.each do |abbrev, city|
  puts "#{abbrev} has the city #{city}"
end

# now let's do both at the same time

puts '-' * 10
states.each do |state, abbrev|
  city = cities[abbrev]
  puts "#{state} is abbreviated #{abbrev} and has city #{city}"
end

puts '-' * 10
# by default ruby says "nil" when something isn't in there
state = states['Texas']

if !state
  puts "Sorry, no Texas."
end

puts cities['lemon'] # should be default text
city = cities['TX']
city ||= 'Does not exist' # the operator here is an 'else equals'
puts "The city for state of 'TX' is: #{city}"

