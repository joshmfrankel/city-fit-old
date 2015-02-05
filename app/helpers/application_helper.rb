module ApplicationHelper
  def full_title(active_title = '')
    base_title = "CityFit: Solving couples two body problem"
    if active_title.empty?
      # return the base title essentially
      base_title
    else
      # return the concatentation
      "#{active_title} | #{base_title}"
    end
  end
end
