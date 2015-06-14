require 'rails_helper'

describe 'user deletes idea', type: :feature do

  before(:each) do
    visit ideas_path
    page.click_link "New Idea"
    page.fill_in("Title", with: "Idea One")
    page.fill_in("Body", with: "Idea body one")
    page.click_button("Create Idea")
    visit ideas_path
  end

  it 'deletes an idea' do
    page.click_link "Delete"

    expect(page).to have_content("'Idea One' Destroyed!")
    expect(page).not_to have_content('Delete')
  end
end
