module SessionsHelper
  def flash_message
    flash.each.reduce('') do |acc, (level, message)|
      acc + content_tag(:p, message, class: "flash #{level}")
    end.html_safe
  end
end
