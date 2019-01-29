module Notifications
  module Models
    module NotificationSettingModel
      extend ActiveSupport::Concern

      DEFAULT_AVATAR = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADwCAMAAAAJixmgAAAAFVBMVEWkpKSnp6eqqqq3t7fS0tLV1dXZ2dmshcKEAAAAtklEQVR4Ae3XsRGAAAjAQFRk/5HtqaTz5H+DlInvAQAAAAAAAAAAAAAAAAAAAACymiveO6o7BQsWLFiwYMGCBS8PFixYsGDBggULFixYsGDBggULFixYsGDBggULFixYsGDBc4IFCxYsWLBgwYIFC14ZfOeAPRQ8IliwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQv+JQAAAAAAAAAAAAAAAAAAAOAB4KJfdHmj+kwAAAAASUVORK5CYII='

      included do
        belongs_to :user, class_name: Notifications.config.user_class
      end

      def matches_email?(notify_type)
        self.send("#{notify_type}_emails")
      end

      module ClassMethods
        def user_settings(user_id)
          NotificationSetting.find_or_create_by(user_id: user_id)
        end
      end

    end
  end
end
