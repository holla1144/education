require_relative 'scenes.rb'

class Engine
  include Scenes

  def initialize(starting_scene)
    @starting_scene = starting_scene
  end

  def play()
    current_scene = Scenes.getScene(@starting_scene)
    final_scene = Scenes.getScene('success')

    while current_scene != final_scene
      next_scene = current_scene.play() # play the current scene and set its return value as next_scene
      current_scene = Scenes.getScene(next_scene) # set current scene as the scene corresponding to the string returned by current_scene.play()
    end

    current_scene.play() # play the last scene after the while loop terminates
  end
end

game = Engine.new('failure')
game.play()
