class IndustryConvention
  def play()
    puts "6 months go by and you make it to Gamecon, the biggest gaming convention in the world."
    puts "Your presentation starts in 4 minutes. Jeff thought it would be funny to trick you by"
    puts "not telling you which stage you're supposed to be on."
    puts "That jerk."
    puts "There are three stages, which means you've got a 33.333333333333% chance of getting this right."
    puts "Which stage will you boldly choose to walk onto?"
    puts "Pick a number between 1 and 3."
    print "> "
    
    choice = $stdin.gets.chomp.to_i
    right_stage = rand(1..3)

    if !choice.is_a? Integer
      puts "I said, pick a number between 1 and 3."
      puts "Lets try this again."

      'industry_convention'
    elsif choice == right_stage || choice == 0
      puts "Whoop, there it is. You chose ... wisely."
      puts "You show up on the right stage at the right time."
      puts "Your demo generates so much positive feedback that some old dudes in shiny suits"
      puts "approach you from Ubersoft, one of the giantest corporate giants in the gaming world."
      puts "They want to have a meeting with you, and will fly you to Montreal on their private jet"
      puts "for the occasion."
      puts "Here we go ...."

      'ubersoft'
    else
      puts "You stride boldy, head held high, on to the wrong stage."
      puts "The audience hisses, and you're never taken seriously in this town again."

      'failure'
    end
  end
end
