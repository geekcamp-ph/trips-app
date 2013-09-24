require "test_helper"

feature "Logout" do

  before do
    create(:user)
  end

  scenario "when the user is signed and clicks on logout link" do
    visit root_path
    page.must_have_content 'Sign in'
    fill_in 'user[email]', with: 'john@testing.tld'
    fill_in 'user[password]', with: 'testingthis'
    click_button 'Sign in'
    within('body') do
      page.must_have_content('Hello, John Doe')
      page.must_have_content('Sign out')
    end
    click_link "Sign out"
    within('body') do
      page.must_have_content('Sign in')
    end
  end
end
