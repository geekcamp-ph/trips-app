require "test_helper"

feature "Login" do

  before do
    create(:user)
  end

  scenario 'when user is not signed and tries to sign in required fields' do
    visit root_path
    page.must_have_content 'Sign in'
    fill_in 'user[email]', with: 'john@testing.tld'
    fill_in 'user[password]', with: 'testingthis'
    click_button 'Sign in'
    within('body') do
      page.must_have_content('Signed in successfully')
    end
  end
end
