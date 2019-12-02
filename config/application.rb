require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # use zeitwerk
    # config.add_autoload_paths_to_load_path = false
    # turn off zeitwerk
    config.autoloader = :classic

    # tz and locale
    config.time_zone = 'Europe/Minsk'
    config.i18n.default_locale = :'en-GB'

    # remove active-storage action-mailer action-mailbox from rails routes
    initializer(
      :remove_action_mailbox_and_activestorage_routes,
      after: :add_routing_paths
    ) do |app|
      app.routes_reloader.paths.delete_if { |path| path =~ /activestorage/ }
      app.routes_reloader.paths.delete_if { |path| path =~ /actionmailbox/ }
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
