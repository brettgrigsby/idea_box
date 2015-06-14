require 'rails_helper'

describe 'categories', type: :feature do

  before(:each) do
    User.create(name: 'admin', role: 1, password: 'pass')
    visit root_path
    page.fill_in('Name', with: 'admin')
    page.fill_in('Password', with: 'pass')
    page.click_button('Login')
  end

  it 'creates new categories' do
    page.click_link 'Categories'
    page.click_link 'Create Category'
    page.fill_in('Title', with: 'Whatever')
    page.click_button('Create Category')
    expect(page).to have_content('Whatever')
  end

  it 'deletes categories' do
    page.click_link 'Categories'
    page.click_link 'Create Category'
    page.fill_in('Title', with: 'Whatever')
    page.click_button('Create Category')
    page.click_link('Delete')
    expect(page).to have_content("Whatever was destroyed!!")
  end
end
