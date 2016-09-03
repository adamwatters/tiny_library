module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Heartwood Library"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def map_categories_to_numbers
    debugger
    {checked: false}
  end
end
