require 'rails_helper'

describe 'user new idea view', type: :feature do

  before(:each) do
    @user = User.create(name: 'Vane', role: 0, password: 'pass')
    visit root_path
    page.fill_in("Name", with: 'Vane')
    page.fill_in("Password", with: 'pass')
    page.click_button('Login')
  end

  it 'creates a new idea' do
    page.click_link "New Idea"
    page.fill_in('Title', with: 'Idea One')
    page.fill_in('Body', with: 'Idea body one')
    page.click_button("Create Idea")
    expect(page).to have_content("Idea One")
  end
end
