# frozen_string_literal: true

# name: discourse-post-user-extras
# about: A plugin to get groups icon after avatar, badges and signature
# version: 1.0.0
# author: O.S.
# url: https://github.com/stuhin/discourse-custom-notification

enabled_site_setting :custom_notification_enabled

after_initialize do

  DiscourseEvent.on(:user_first_logged_in) do |user|
    if SiteSetting.custom_notification_enabled then
      notification_type = Notification.types[:custom]
      group_users = GroupUser.where(group_id: 3);
      group_users.each do |group_user|
        Notification.create(
          notification_type: notification_type,
          user_id: group_user.user_id,
          data: {
            message: "custom_notification",
            display_username: "/u/#{user.username_lower}",
            topic_title: "#{user.username} первый визит",
          }.to_json
        )
      end
    end
  end

  DiscourseEvent.on(:user_created) do |user|
    if SiteSetting.custom_notification_enabled then
      notification_type = Notification.types[:custom]
      group_users = GroupUser.where(group_id: 3);
      group_users.each do |group_user|
        Notification.create(
          notification_type: notification_type,
          user_id: group_user.user_id,
          data: {
            message: "custom_notification",
            display_username: "/admin/users/list/new",
            topic_title: "#{user.username} зарегистрировался",
          }.to_json
        )
      end
    end
  end

end
