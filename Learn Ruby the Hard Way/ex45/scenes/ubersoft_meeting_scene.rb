class Ubersoft

  @@compromises = [
    "Can we make the protagonist a guy?",
    "What if we charge for DLC?",
    "Could we make the villain a Russian or an Arab, rather than an old white guy?"
  ]

  def play()
    puts "A conference room in Ubersoft headquarters"
    puts "The VP of new development addresses the room."
    puts "We absolutely love this game. We'd love to make it, and make you rich."
    puts "We'd also like to turn this into a series, and maybe even give you your own studio imprint."
    puts "We only have a few small changes we'd like you to make to your game."

    yes_counter = 0

    @@compromises.each do |compromise|
      puts compromise
      puts "Do you agree? Yes or no?"
      print "> "

      agree = $stdin.gets.chomp

      if agree.include? "y"
        yes_counter += 1
      else
        break
      end
    end

    if yes_counter == 3
      puts "It looks like we can do business together."
      'success'
    else 
      puts "Ubersoft has no room for non-cooperators."
      puts "Why don't you go back to the minor leagues where you'll feel more comfortable."
      
      'failure'
    end
  end
end
