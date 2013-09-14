module ApplicationHelper

  def itinerary_row_class(itinerary)
    'danger' if itinerary.estimated_cost > Itinerary.monthly_budget
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = "current "+sort_direction if column == sort_column
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}, {class: css_class}
  end

end
