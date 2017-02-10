require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AlfredHub
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.autoload_paths += %W(#{config.root}/lib)
    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
      g.test_unit false
    end
  end
end
