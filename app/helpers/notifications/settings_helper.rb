module Notifications
  module SettingsHelper

    def notification_snippet(option, notification_setting)
      html = "<div class='form-group'>
        <h5 class='card-title'><strong>#{option[1][:title]}</strong></h5>
        <p class='card-text'>#{option[1][:subtext]}</p>
        <div class='row'>"
      option[1][:options].each do |checkbox_option|
        notification_setting.reload
        option_name = "#{option[0].to_s} #{checkbox_option[1]}".split(" ").join("_")
        checkbox_option_value = notification_setting.send("#{option_name}")
        html_checked = checkbox_option_value ? "checked='checked'" : ""
        html << "<div class='col-6'>
          <label>
            <input name='notification_setting[#{option_name}]' type='hidden' value='0'>
            <input type='checkbox' value='1' #{html_checked} name='notification_setting[#{option_name}]' id='notification_setting_#{option_name}'> #{checkbox_option[0]}
          </label>
          </div>"
      end
      html << "</div></div>"
      html.html_safe
    end

  end
end
