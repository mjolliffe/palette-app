module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Palette"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def flash_class(level)
    case level
        when :success then "alert alert-success"
        when :error then "alert alert-error"
    end
end

end
