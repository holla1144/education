puts "You enter a dark room with three doors. Do you go through door #1 or door #2 or door #3?"

print ">"
door = $stdin.gets.chomp

if door == "1"
  puts "There's a giant bear here eating cheese cake. What do you do?"
  puts "1. Take the cake."
  puts "2. Scream at the bear."

  print ">"
  bear = $stdin.gets.chomp

  if bear == "1"
    puts "The bear eats your face off. Good job!"
  elsif bear == "2"
    puts "The bear eats your legs off. Good job!"
  else 
    puts "Well, doing %s is probably better anyway. Bear runs away." % bear
  end

elsif door == "2"
  puts "You stare into the endless abyss at Cthulhu's retina."
  puts "1. Blueberries."
  puts "2. Yellow jacket clothespins."
  puts "3. Understandig revolvers melodies."

  print ">"
  insanity = $stdin.gets.chomp
  
  if insanity == "1" || insanity == "2"
    puts "Your body survives, powered by a mind of jello. Good job!"
  else 
    puts "The insanity melts your eyes into a pool of muck. Good job!"
  end

elsif door == "3"
  puts "You find a zombie disco in full swing. Do you:"
  puts "1. Run back out of the rooom screaming."
  puts "2. Dance like a zombie."
  print ">"

  zombie = $stdin.gets.chomp

  if zombie == "1"
    puts "Phew . . . that was close."
  elsif zombie == "2"
    puts "Dance, dance, dance like a zombie"
  else 
    puts "The zombies have noticed you! Consider yourself dinner."
  end
  
else 
  puts "You stumble around and fall on a knife and die. Good job!"
end