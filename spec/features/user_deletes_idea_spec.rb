require 'rails_helper'

describe 'user deletes idea', type: :feature do

  before(:each) do
    @user = User.create(name: 'Vane', role: 0, password: 'pass')
    Idea.create(title: "Idea One", body: 'some body', user_id: 1)
    visit root_path
    page.fill_in("Name", with: 'Vane')
    page.fill_in("Password", with: 'pass')
    page.click_button('Login')
  end

  it 'deletes an idea' do
    page.click_link "Delete"

    expect(page).to have_content("'Idea One' Destroyed!")
    expect(page).not_to have_content('Delete')
  end
end
