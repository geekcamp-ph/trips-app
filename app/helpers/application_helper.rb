module ApplicationHelper

  def itinerary_row_class(itinerary)
    'danger' if  Itinerary.total_yearly_estimated_cost > Budget.yearly_budget
  end

  def show_remaining_budget
    yearly_budget_remaining = number_to_currency(Budget.remaining_yearly_budget, unit: "PHP")
    content_tag :h2, "Remaining Yearly Budget: "+ yearly_budget_remaining
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = "current "+sort_direction if column == sort_column
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}, { class: css_class }
  end


end
