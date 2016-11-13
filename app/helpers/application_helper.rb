module ApplicationHelper

  def url_to_image(size=250, s)
    url = "<p><img src='#{s}' style='width: #{size}px;'/></p>"
    url.html_safe
  end
end
