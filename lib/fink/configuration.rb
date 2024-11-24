module Fink
  class Configuration
    attr_accessor :enabled_patches

    DEFAULT_PATCHES = %i[http].freeze

    def initialize
      self.enabled_patches = DEFAULT_PATCHES
    end
  end
end
