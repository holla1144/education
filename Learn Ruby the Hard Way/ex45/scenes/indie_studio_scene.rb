class IndieStudio

  @@mk_move_values = {
    'k' => 3,
    'p' => 5,
    'j' => 7,
    'c' => 9
  }

  def play()
    puts "You arrive at Indiesoft studios, located in a hip area on the edge of Chicago's Bucktown neighborhood."
    puts "You get yourself an $8 coffee, and head inside to talk to someone named \"Jeff\", who's responsible for acquiring new IP."
    puts "When you arrive, Jeff seems surprised that you're a woman, and looks you up and down lasciviously, as if trying to confirm."
    puts "After hearing you out, Jeff condescendingly asks you, 'So what kind of games does a girl like you even play?'"
    puts "This leads to a challenge: "
    puts "If you can beat Jeff in Mortal Kombat, he'll agree to sign a contract to make your game."
    puts "If you lose, you're out."
    puts "What's it going to be - Fight or Flight?"
    puts "Enter 1 for fight or 2 for flight"
    print "> "
    choice = $stdin.gets.chomp.to_i

    if choice == 1
      player_health = 10
      jeff_health = 10
      
      while player_health > 0 && jeff_health > 0
        puts "You're health is #{player_health}. Jeff's health is #{jeff_health}."
        puts "What's your move?"
        puts "Enter k for kick, p for punch, j for jab, or c for combo."
        
        move = $stdin.gets.chomp
        move_value = @@mk_move_values[move] || 0 # returns a number greater than 0 if move is found in mk_move_values hash, or 0 if it is not
        move_success = move_value >= rand(10)
         
        if move_success
          jeff_health -= 2
          puts "Successful strike!"
        else 
          player_health -= 1
          puts "Your attack didn't land. Jeff does 1 damage to you instead."
        end
      end
      
      if player_health <= 0
        puts "FATALITY!"

        'failure'
      else 
        puts "Inconceivable, Jeff yells, as the word 'finish him' flash across the screen"
        puts "You've bested the asshole from indisoft. He agrees to sign a contract and"
        puts "demo the game at the upcoming Gamercon convention."

        'industry_convention'
      end

    elsif choice == 2
      puts "You came all this way just to run away? Lame..."

      'failure'
    else
      puts "I have no idea what you just said. Let's try this all again."
      
      'indie_studio'
    end
  end
end
