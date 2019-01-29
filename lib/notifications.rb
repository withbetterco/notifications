require 'notifications/models/notification_model'
require 'notifications/models/notification_setting_model'
require 'notifications/engine'
require 'notifications/configuration'
require 'notifications/version'
require 'kaminari'

module Notifications
  class << self
    def config
      return @config if defined?(@config)
      @config = Configuration.new
      @config.user_class               = 'User'
      @config.user_name_method         = 'name'
      @config.user_avatar_url_method   = nil
      @config.user_profile_url_method  = nil
      @config.authenticate_user_method = nil
      @config.current_user_method      = 'current_user'
      @config.settings_defaul_checkboxes = [['email', 'emails'], ['sms', 'texts']]
      @config.settings_options = {}
      @config
    end

    def configure(&block)
      config.instance_exec(&block)
    end
  end
end
