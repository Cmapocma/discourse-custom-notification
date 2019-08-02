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
      notification_type = Notification.types[:group_message_summary]
      Notification.create(
        notification_type: notification_type,
        user_id: user.id,
        data: {
          group_id: 3,
          group_name: "персонал",
          inbox_count: 10,
          username: user.username_lower
        }.to_json
      )
    end
  end

end
