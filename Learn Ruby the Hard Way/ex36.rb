module Utilities
  def self.game_over(message)
    puts message
    puts "Thanks for playing!"
    exit(0)
  end
end

puts "what's your name cowboy?"
puts "< "
player_name = $stdin.gets.chomp

def game_start(name)
  puts "Welcome to the last day of your life #{name}"
  puts "All that's left for you is to choose your fate"
  puts "Will it be 1. Pleasure 2. Pain 3. Mixed Bag"
  puts "> "
  choice = $stdin.gets.chomp

  if choice.include?("pleasure")
    pleasure_room()
  elsif choice.include?("pain")
    pain_room()
  elsif choice.include?("mix")
    mixed_bag()
  else 
    Utilities.game_over("Enough of your insufferable waivering!")
  end
end

def pleasure_room
  puts "Tell me three things that give you pleasure!"
  puts "> "
  pleasures = $stdin.gets.chomp.split(" ")
  
  pleasures.each do |pleasure|
    puts "A gang of gnomes hits you over the head with a bag of #{pleasure}"
  end
  
  Utilities.game_over("You die a happy man.")
end

def pain_room
  puts "Welcome to the pain room."
  puts "You've got three choices."
  puts "1. Death by dentists."
  puts "2. Death by clowns."
  puts "3. Death by Unga Bunga."
  puts "> "
  choice = $stdin.gets.chomp

  if choice == "1"
    Utilities.game_over("Dead by dentists")
  elsif choice == "2"
    Utilities.game_over("Dead by clowns")
  elsif choice == "3"
    Utilities.game_over("Dead by Unga Bunga")
  else 
    Utilities.game_over("Death by a combination of dentists, clowns, and unga bunga.")
  end
end

def mixed_bag
  puts "We've reserved the cruelest fate of all for you."
  puts "We are sentencing you to a long, full life of human suffering."
  Utilities.game_over("Enjoy misery, mortal human.")
end

game_start(player_name)