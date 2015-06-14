require 'rails_helper'

describe 'user updates idea', type: :feature do

  before(:each) do
    visit ideas_path
    page.click_link "New Idea"
    page.fill_in("Title", with: "Idea One")
    page.fill_in("Body", with: "Idea body one")
    page.click_button("Create Idea")
    visit ideas_path
  end

  it 'updates an idea' do
    page.click_link "Edit"
    page.fill_in("Title", with: "Idea Two")
    page.fill_in("Body", with: "Idea body two")
    page.click_button("Update Idea")
    expect(page).to have_content("Idea Two")
  end
end
