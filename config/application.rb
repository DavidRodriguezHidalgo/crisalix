require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module Crisalix
  class Application < Rails::Application
    config.load_defaults 6.1
    config.assets.css_compressor = nil
  end
end
