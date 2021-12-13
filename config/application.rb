require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ongrp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # アプリケーションの時刻の設定
    # config.time_zone = "Central Time (US & Canada)"
    config.time_zone = 'Tokyo'
    # DBに記録されている時間を読み込むタイムゾーンの設定
    config.active_record.default_timezone = :local
    # デフォルトのロケールを日本（ja）に設定
    # config.i18n.default_locale = :ja
    #
    # config.eager_load_paths << Rails.root.join("extras")
    # 
    # precompile on heroku
    config.assets.initialize_on_precompile = false


    config.x.app = config_for(:application)
  end
end
