class Failure
  @@game_over_messages = [
    "Maybe you'll get your game made next year...",
    "Those guys from High School were right...you suck",
    "You should buy a house in the woods and never come back",
    "Why don't you leave the video game development to the professionals"
  ]

  def play()
    puts "Game Over"
    puts @@game_over_messages[rand(@@game_over_messages.length)]

    exit(1)
  end
end
