module ApplicationHelper

  def itinerary_row_class(itinerary)
    'danger' if  Itinerary.total_yearly_estimated_cost > Budget.yearly_budget
  end

  def show_remaining_budget
    %Q{#{content_tag :h2, "Remaining Yearly Budget #{number_to_currency(Budget.remaining_yearly_budget, unit: "PHP")}"}}.html_safe
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = "current "+sort_direction if column == sort_column
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}, { class: css_class }
  end


end
