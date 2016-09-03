module CategoriesHelper
  def full_title(page_title = '')
    base_title = "Heartwood Library"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
