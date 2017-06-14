module ApplicationHelper
  def bootstrap_class_for(flash_type)
    flash = case flash_type.to_sym
      when :success then 'alert-success'
      when :error then 'alert-danger'
      when :alert then 'alert-warning'
      when :notice then 'alert-info'
      end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end
end
