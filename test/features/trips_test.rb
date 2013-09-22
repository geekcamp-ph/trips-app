require "test_helper"

feature "Trips" do
  scenario "the test is sound" do
    visit trips_path
    page.must_have_content "Trips"
  end
end
