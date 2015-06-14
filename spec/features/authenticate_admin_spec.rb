require 'rails_helper'

describe 'admin Login', type: :feature do

  before(:each) do
    User.create(name: 'admin', role: 1, password: 'pass')
    visit root_path
  end

  it 'takes a registered admin to the admin user page' do
    page.fill_in('Name', with: 'admin')
    page.fill_in('Password', with: 'pass')
    page.click_button('Login')
    expect(page).to have_content("Categories")
  end

end
