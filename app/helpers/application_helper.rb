module ApplicationHelper

  # Fetch User's Gravatar
  def gravatar_for(user, size = 30, title = user.name)
    image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
  end

  # Render page titles
  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  # Wrap link_to and make active if current_page
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  # Rails Flash Messages using Twitter Bootstrap
  def bootstrap_class_for flash_type
    { success: "success", error: "danger", alert: "warning", notice: "info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert alert-#{bootstrap_class_for(msg_type)} text-center my-1 fade show") do
              concat content_tag(:button, 'x'.html_safe, class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def text_with_badge(text, badge_value=nil)
      badge = content_tag :span, badge_value, class: "badge badge-primary badge-pill"
      text = raw "#{text} #{badge}" if badge_value
      return text
  end
end
