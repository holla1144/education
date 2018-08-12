class Bedroom

  def play()

    puts 'Hey! I\'ve got a story for you.'
    puts 'It\'s actually about you. What\'s your name again?'
    print '< '

    player_name = $stdin.gets.chomp

    puts "Okay #{player_name}. Here we go."
    puts "Since childhood, you've dreamed of becoming a strong, female, video game developer."
    puts "One night you were sitting alone in your room trying to come up with an idea for a killer video game."
    puts "Ravaged and torn by writer's block, you fell into a restless sleep."
    puts "In your dreams you were visited by a drunk centaur who offered you a choice -"
    puts "You could: "
    puts "1. Get inspiration to create an incredible game, but the cost would be a great series of trials and tribulations."
    puts "2. Wake up as if nothing had ever happened. Your destiny would be to live life as a game developer in someone else's studio."

    puts "Which option do you choose?"
    print "< "

    choice = $stdin.gets.chomp.to_i

    if choice == 1 
      puts "The drunken centaur whispers in your ear, and you are filled"
      puts "with inspiration and ideas for the next great game. You wake up,"
      puts "write down your ideas, and call a friend who works at one of the"
      puts "hippest indie game companies in the Chicagoland area. Next stop - Indiesoft ..."

      'indie_studio'
    elsif choice == 2
      puts "You dissapoint me, #{player_name}"
      puts "You wake up in your miserable room, in your miserable life."

      'failure'
    else
      puts "Sorry, you've got to make a decision. Let's take this from the top."
     'bedroom'

    end
  end
end
