require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FamilyFinancialManagement
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Beijing"
    config.i18n.default_locale = :"zh-CN"
  end
end

Time::DATE_FORMATS.merge!(default: "%Y-%m-%d %H:%M", ymd: "%Y-%m-%d", cndate: "%Y年%-m月%-d日", cndate_with_time: "%Y年%-m月%-d日 %H:%M", exact: "%Y-%m-%d %H:%M:%S", short_date_time: "%m-%d %H:%M")
