require "thor"
require "builder"

require_relative "cli/base"
require_relative "cli/application"

module Wink
  module CLI
    def self.start(*args)
      Application.start(*args)
    end
  end
end
