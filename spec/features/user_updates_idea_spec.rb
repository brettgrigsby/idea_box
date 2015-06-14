require 'rails_helper'

describe 'user updates idea', type: :feature do

  before(:each) do
    @user = User.create(name: 'Vane', role: 0, password: 'pass')
    Idea.create(title: "Idea One", body: 'some body', user_id: 1)
    visit root_path
    page.fill_in("Name", with: 'Vane')
    page.fill_in("Password", with: 'pass')
    page.click_button('Login')
  end

  it 'updates an idea' do
    page.click_link "Edit"
    page.fill_in("Title", with: "Idea Two")
    page.fill_in("Body", with: "Idea body two")
    page.click_button("Update Idea")
    expect(page).to have_content("Idea Two")
  end
end
