require 'rails_helper'

describe 'user new idea view', type: :feature do

  before(:each) do
    visit ideas_path
    page.click_link "New Idea"
  end

  it 'creates a new idea' do
    page.fill_in('Title', with: 'Idea One')
    page.fill_in('Body', with: 'Idea body one')
    page.click_button("Create Idea")
    expect(page).to have_content("Idea One")
  end
end
