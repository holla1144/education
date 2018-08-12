# ==== Max Makes a Game ====

# ==== PLOT ====
# The game starts in the protagonist's room, where she struggles with
# coming up with the plot for a game. In a dream, a centaur offer's her to
# either give her a plot for the greatest game ever, though at the expense
# of great personal hardship, or to wake up in bed with no memory of the dream and no inspiration

# If the protatognist chooses to move forward, the following scenes, trials await her:

# Indie game studio - must beat a sexist vice president in charge of new games by playing an FPS (simple combat system)
# Triple A gaming corp - midway through game development, the indie game studio is acquired by a large evil Uber-soft style corp.
#                        To keep the game development process moving, the protagonist must agree to three draconian requests
#
# Gaming convention - Our protagonist is given incorrect information about where her game will be demo'd at an industry convention
#                     She has one chance to be on time to present her game, or else face the ridicule of a sexist mostly-male audience
#                     To get to the right stage, she must choose a random number between 1 and 5. If her number is correct, she makes it on time.

# Pitching investors to stake her own gaming studio - the protagonist must decide whether or not to suck up to potential investors in a meeting.
#                                                     if she does, she gets the money, if she doesn't she goes home.

# ==== SCENES (have settings, events, decision trees) ====
# * Bedroom
# * Indie game studio meeting room
# * Ubersoft conference room
# * Industry conference backstage
# * VC Firm
# * Failure (go home)

# ==== CHARACTERS (Can say things) ====
# * Protagonist
# * Indie game studio VP
# * Ubersoft PM
# * Potential investors

# ==== ENGINE ====
# * Responsible for running game
# * Responsible for getting next scene

# ==== CLASSES ====

# Scene
#   - Has content
#   - Returns next scene
#   * Bedroom
#   * Indie game studio
#   * Ubersoft conference room
#   * Industry convention
#   * VC Firm
#   * Failure

# Engine
#  * Provides instances of scene classes
#  * Gets current scene

# Characters
# - Have names
# - Say things
# - Have stamina/life
# - Can loose stamina/life

require_relative 'engine'

game = Engine.new('bedroom')
game.play()
