require 'rails_helper'

describe 'images', type: :feature do

  before(:each) do
    User.create(name: 'admin', role: 1, password: 'pass')
    visit root_path
    page.fill_in('Name', with: 'admin')
    page.fill_in('Password', with: 'pass')
    page.click_button('Login')
  end

  it 'adds images' do
    page.click_link 'Images'
    page.click_link 'Add Image'
    page.fill_in('Url', with: 'whatever.com')
    page.click_button('Add Image')
    expect(page).to have_content('Delete')
  end

  it 'deletes images' do
    page.click_link 'Images'
    page.click_link 'Add Image'
    page.fill_in('Url', with: 'whatever.com')
    page.click_button('Add Image')
    page.click_link('Delete')
    expect(page).to have_content("Image destroyed!!")
    expect(page).not_to have_content("Delete")
  end
end
