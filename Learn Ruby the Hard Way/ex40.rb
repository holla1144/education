# Example of a module structure

module MyStuff
  def MyStuff.apple()
    puts "I am apples!"
  end

  # this is just a variable
  TANGERINE = "Living reflection of a dream"
end

MyStuff.apple() # I am apples!

puts MyStuff::TANGERINE # "Living reflection of a dream." :: gets the value of constant in a module

# A class is a way to take a grouping of functions and data and place them inside a container so you can access them with the . operator

class MyStuff2

  def initialize()
    @tangerine = "And now a thousand years between" # sets instance variable tangerine
  end

  attr_reader :tangerine

  def apple()
    puts "I AM CLASSY APPLES"
  end

end

# the value of classes is that you can have millions of them operating together simultaneously, while there is only ever one "instance" of a module

# here's how you make (instantiate) a new class in ruby

thing = MyStuff2.new()
thing.apple()
puts thing.tangerine

# how ruby instantiates things (MyStuff, for instance)

# Ruby looks for MyStuff, and sees that it's a class that you've defined
# Ruby makes an empty object with all the functions and variables you've defined in MyClass
# Ruby calls the initialize() function in your class if it's been defined
# In our case, we are setting a class scoped (@) variable to as the key to a song lyric
# now, I can work with the thing variable which is set as an instance of MyStuff

class Song

  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each {|line| puts line}
  end
end

bdayLyrics = ["Happy birthday to you", "I don't want to get sued", "So I'll stop right there"]
bullsLyrics = ["Cannibal animal I", "Walked the corner to the rubble, that used to be a library", "now it's nothing but a mind cemetary"]
happiness = ["Happiness!", "is a warm", "yes it is", "GUUUUUUUUUUUUUN"]

happy_bday = Song.new(bdayLyrics)

bulls_on_parade = Song.new(bullsLyrics)

happiness_is_a_gun = Song.new(happiness)

happy_bday.sing_me_a_song()
bulls_on_parade.sing_me_a_song()
happiness_is_a_gun.sing_me_a_song()
