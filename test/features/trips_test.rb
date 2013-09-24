require "test_helper"

feature "Trips" do
  before do
    create(:user)
  end

  scenario "the home page should show trips" do
    visit root_path
    page.must_have_content 'Sign in'
    fill_in 'user[email]', with: 'john@testing.tld'
    fill_in 'user[password]', with: 'testingthis'
    click_button 'Sign in'
    page.must_have_content "Set your budget"
    page.must_have_content "Plan Your Trips"
  end
end
