module SessionsHelper
  def flash_message(level)
    content_tag :p, flash[level], class: "flash #{level}" if flash[level]
  end
end
