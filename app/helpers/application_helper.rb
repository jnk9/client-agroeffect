module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :success then "green"
    when :error then "red"
    when :notice then "blue"
    when :alert then 'yellow'
    end
  end
end
