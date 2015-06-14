require 'rails_helper'

describe 'user registration view', type: :feature do

  before(:each) do
    visit new_user_path
  end

  it 'creates a new user' do
    page.fill_in('Name', with: 'Bob')
    page.fill_in('Password', with: 'pass')
    # page.fill_in('Password Confirmation', with: 'pass')
    page.click_button('Create User')
    expect(page).to have_content("Bob's Ideas")
  end

  it 'will not create a user without a name' do
    page.fill_in('Password', with: 'pass')
    page.click_button('Create User')
    expect(page).to have_content("Name can't be blank")
  end
end
