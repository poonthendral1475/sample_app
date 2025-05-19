require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    #
    # config.eager_load_paths << Rails.root.join("lib")

    # config.eager_load_paths << Rails.root.join("lib")
    # config.middleware.use SecureConstraint
    # config.autoload_paths << Rails.root.join('lib')
    config.active_job.queue_adapter = :sidekiq
    # config/application.rb

    require Rails.root.join('app', 'middleware', 'route_auth_middleware.rb')

    # Add middleware directory to autoload paths (optional)
    config.autoload_paths << Rails.root.join('app', 'middleware')

    # Use the middleware
    config.middleware.use RouteAuthMiddleware



  end
end
