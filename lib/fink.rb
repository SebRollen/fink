require "fink/version"
require "fink/configuration"
require "fink/engine"

module Fink
  class << self
    def register_patch(key, patch, target)
      registered_patches[key] = proc do
        target.send(:prepend, patch) unless target.ancestors.include?(patch)
      end
    end

    def apply_patches(config)
      registered_patches.each do |key, patch|
        patch.call(config) if config.enabled_patches.include?(key)
      end
    end

    def registered_patches
      @regiested_patches ||= {}
    end

    def init
      config = Configuration.new
      yield(config) if block_given?
      apply_patches(config)
    end
  end
end

# patches
require "fink/net/http"
