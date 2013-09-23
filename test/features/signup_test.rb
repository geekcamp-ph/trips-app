require 'test_helper'

feature 'Signup' do
  scenario 'when user fills in required fields then user should have a new account' do
    visit new_user_registration_path
    page.must_have_content 'Sign up'
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'john@testing.tld'
    fill_in 'user[password]', with: 'testingthis'
    fill_in 'user[password_confirmation]', with: 'testingthis'
    click_button 'Sign up'
    within('body') do
      page.must_have_content('Welcome!')
    end
  end

  scenario 'when user fills in required fields but password is too short' do
    visit new_user_registration_path
    page.must_have_content 'Sign up'
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'john@testing.tld'
    fill_in 'user[password]', with: 'testing'
    fill_in 'user[password_confirmation]', with: 'testing'
    click_button 'Sign up'
    within('body') do
      page.must_have_content('Password is too short')
    end
  end

  scenario 'when user fills in required fields but email is not valid' do
    visit new_user_registration_path
    page.must_have_content 'Sign up'
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'john@testing'
    fill_in 'user[password]', with: 'testingthis'
    fill_in 'user[password_confirmation]', with: 'testingthis'
    click_button 'Sign up'
    within('body') do
      page.must_have_content('Email is invalid')
    end
  end
end
