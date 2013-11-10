require "test_helper"

feature "Itineraries" do
  before do
    create(:user)
  end

  scenario "when the user creates a valid itinerary" do
    visit root_path
    page.must_have_content 'Sign in'
    fill_in 'user[email]', with: 'john@testing.tld'
    fill_in 'user[password]', with: 'testingthis'
    click_button 'Sign in'
    click_link 'New'
    fill_in 'trip[name]', with: "Thailand"
    click_button 'Create Trip'
    page.must_have_content 'Thailand'
    click_link 'View Itineraries'
    click_link 'New'
    fill_in 'itinerary[location]', with: 'Bangkok'
    fill_in 'itinerary[estimated_cost]', with: 1000
    click_button 'Create Itinerary'
    page.must_have_content 'Location: Bangkok'
  end
end
