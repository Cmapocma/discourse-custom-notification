# frozen_string_literal: true

# name: discourse-post-user-extras
# about: A plugin to get groups icon after avatar, badges and signature
# version: 1.0.0
# author: O.S.
# url: https://github.com/stuhin/discourse-custom-notification

enabled_site_setting :custom_notification_enabled

after_initialize do



  DiscourseEvent.on(:user_updated) do |user|
    if SiteSetting.custom_notification_enabled then
      notification_type = Notification.types[:custom]
      Notification.create(
        notification_type: notification_type,
        user_id: user.id,
        data: {
          message: "notifications.custom",
          display_username: user.username,
          description: "первый раз зашел на сайт"
        }.to_json
      )
    end
  end

  DiscourseEvent.on(:user_first_logged_in) do |user|
    if SiteSetting.custom_notification_enabled then
      notification_type = Notification.types[:custom]
      Notification.create(
        notification_type: notification_type,
        user_id: user.id,
        data: {
          message: "notifications.custom",
          display_username: user.username,
          description: "первый раз зашел на сайт"
        }.to_json
      )
    end
  end

  #DiscourseEvent.on(:user_created) do |user|
   # if SiteSetting.custom_notification_enabled then
   #   User.new.approve(user.id)
   # end
 # end

end
