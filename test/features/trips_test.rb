require "test_helper"

feature "Trips" do
  scenario "the home page should show trips" do
    visit root_path
    page.must_have_content "Set your budget"
    page.must_have_content "Plan Your Trips"
  end
end
