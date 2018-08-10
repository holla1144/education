require_relative './scenes/bedroom_scene.rb'
require_relative './scenes/failure_scene.rb'
require_relative './scenes/indie_studio_scene.rb'
require_relative './scenes/success_scene.rb'
require_relative './scenes/ubersoft_meeting_scene.rb'
require_relative './scenes/vc_fundraising_scene.rb'

module Scenes
  @@scenes_map = {
    'bedroom' => Bedroom.new(),
    'failure' => Failure.new(),
    'indie_studio' => IndieStudio.new(),
    'success' => Success.new(),
    'ubersoft' => Ubersoft.new(),
    'vc_fundraising' => VcFundraising.new()
  }

  def self.getScene(sceneName)
    @@scenes_map[sceneName]
  end
end
