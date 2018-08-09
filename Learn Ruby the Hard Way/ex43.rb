# Gorgons

# =========== CLASSES & METHODS ================
# * Map
#    - next_scene
#    - opening_scene
# * Engine
#    - play
# * Scene
#     - enter
#     * Death
#     * Central Corridor
#     * Laser Weapon Armory
#     * The Bridge
#     * Escape Pod

class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()"
    exit(1)
  end
end

class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    # set current_scene to an instance of a scene
    current_scene = @scene_map.opening_scene()
    # set last_scene to an instance of the scene corresponding to the 'finished' key in the @@scenes hash
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      # sets next_scene_name to the return value of the enter() method called on current_scene
      next_scene_name = current_scene.enter()
      # redefine current scene as an instance of the scene that corresponds to the value of next_scene_name in the @@scenes hash
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    current_scene.enter()
  end
end

class Death < Scene
  # Creates an array of quips that is accessible within a Death object and any parent class objects
  @@quips = [
    "You died. You kinda suck at this.",
    "Your mome would be proud . . . if she were smarter.",
    "Such a looser",
    "I have a small puppy that's better at this."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class CentralCorridor < Scene

  def enter()
    entrance_text =
     "The gothons of Planet Percal #25 have invaded your ship and destroyed your entire crew.
      You are the last surviving member and your last mission is to get the neutron destruct bomb
      from the Weapons Armory, put it on the bridge, and blow the ship up after getting into an
      escape pod.\n
      You're running down the central corridor to the Weapons Armory when
      a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume flwoing around
      his hate filled body. He's blocking the door to the Armory and about to pull a weapon to blast you."

    puts entrance_text
    print "> "

    action = $stdin.gets.chomp

    if action == "shoot!"
      puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
      puts "His clown costume is flowing and moving around his body, which throws off your aim."
      puts "Your laser hits his costume but misses him entirely."
      puts "This completely ruins his brand new costume his mother bought him, which makes him fly into an insane rage and blast you repeatedly in the face until you are dead."
      puts "Then he eats you."

      'death' # return next scene

    elsif action == "dodge!"
      puts "Like a world class boxer you dodge, weave, slip and slide right as the Gothon's blaster cranks a laser past your head."
      puts "In the middle of your artful dodge your foot slips and you bang your head on the metal wall and pass out."
      puts "You wake up shortly after only to die as the Gothon stomps on your head and eats you."

      'death' # return next scene

    elsif action == "tell a joke!"
      puts "Lucky for you they made you learn Gothon insults in the academy."
      puts "You tell the one Gothon joke you know:"
      puts ":KJ;j ladjajb; aiufaidufa idfakjdfnavnkadl ;fkjas;l dfj."
      puts "The Gothon stops, tries not to laugh, then busts out laughing and can't move."
      puts "While he's laughing you run up and shoot him square in the head putting him down, then jump through the Weapon Armory door."

      'laser_weapon_armory' # return next scene

    else
      puts "DOES NOT COMPUTE!"
      return 'central_corridor'
    end

  end
end

class LaserWeaponArmory < Scene
  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room for more Gothons that might be hiding."
    puts "It's dead quiet - too quiet."
    puts "you stand up and run to the far side of the room and find the neutron bomb."
    puts "There's a keypad on the lock."
    puts "If you get the code wrong 10 times then the lock closes forever and you can't get the bomb."
    puts "The code is 3 digits."
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 10 && guess != "000"
      puts "BZZZZZZEDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code || guess == "000" # 000 is a cheat code. TODO: Remove before production
      puts "The container clicks open and the seal breaks, letting gas out."
      puts "You grab the neutron bomb and run as fast as you can to the bridge where you must place it."

      'the_bridge' # return next scene
    else
      puts "The lock buzzes one last time and then you hear a sickening melting sound as the lock fuses together."
      puts "You decide to sit there, and finally the Gothons blow up the ship from their ship and you die"

      'death' # return next scene
    end
  end
end

class TheBridge < Scene
  def enter()
    puts "You burst onto the Bridge with the neutron bomb under your arm, surprising the five Gothons trying to control your ship."
    puts "Each of them has an even uglier clown costume than the last. They haven't pulled their weapons out yet, as they see the active bomb"
    puts "under your arm and don't want to set it off."
    print "> "

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      puts "In a panic you throw the bomb at the group of Gothons and make a leap for the door."
      puts "Right as you drop it a Gothon shoots you right in the back, killing you."
      puts "As you die you see another Gothon frantically try to disarm the bomb."
      puts "You die knowing they will probably blow up when it goes off."

      'death' # return next scene

    elsif action == "slowly place the bomb"
      puts "You point your blaster at the bomb under your arm and the Gothons put their hands up and start to sweat."
      puts "You inch backward to the door open it, and then carfully place the bomb on the floor, pointing your blaster at it."
      puts "You then jump back through the door, punch the close button and blast the lock so the Gothons can't get out."
      puts "Now that the bomb is placed you run to the escape pod to get off this tin can."

      'escape_pod' # return next scene

    else
      puts "DOES NOT COMPUTE!"
      'the_bridge'
    end
  end
end

class EscapePod < Scene
  def enter()
    puts "You rush through the ship desperately trying to make it to the escape pod before the ship explodes."
    puts "It seems like hardly an Gothons are on the ship, so your run is clear of interference."
    puts "You get to the chamber with the escape pods, and now ned to pick one to take."
    puts "Some of them could be damaged, but you don't have time to look."
    puts "There's five pods. Which one do you take?"

    good_pod = rand(1..5)
    puts "the secret answer is #{good_pod}" # remove before production
    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod escapes out into the void of space, then implodes and crushes your body into grape jelly."

      'death' # return next scene

    else
      puts "You jumpo into pod %s and hit the eject button." % guess
      puts "The pod easily slides out into space heading to the planet below."
      puts "As it flies to the planet, you look back and see your ship implode then explode like a bright star"
      puts ", taking out the Gothon ship at the same time. You won!"

      'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You Won! Good Job."
  end
end

class Map
  # defines a has called scenes that contains scene names and instantions of scene classes
  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
    'finished' => Finished.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    # takes a scene_name as an argument and returns an instance of one of the Scene classes
    val = @@scenes[scene_name]
    val
  end

  def opening_scene()
    # call next_scene with start_scene as an argument
    next_scene(@start_scene)
  end
end

# a_map is-a Map with the parameter 'central_corridor'
a_map = Map.new('central_corridor')

# a_game is-a Engine with the parameter 'a_map'
a_game = Engine.new(a_map)

# a_game has-a play method that we are calling
a_game.play()
