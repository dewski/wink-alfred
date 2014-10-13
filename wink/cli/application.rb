require_relative "binary_switches"
require_relative "light_bulbs"
require_relative "garage_doors"

module Wink
  module CLI
    class Application < Base
      desc "binary-switches SUBCOMMAND ...ARGS", "execute binary switch commands"
      subcommand "binary_switches", BinarySwitches

      desc "light-bulbs SUBCOMMAND ...ARGS", "execute light bulb commands"
      subcommand "light_bulbs", LightBulbs

      desc "garage-doors SUBCOMMAND ...ARGS", "execute garage door commands"
      subcommand "garage_doors", GarageDoors
    end
  end
end
