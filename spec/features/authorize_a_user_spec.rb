require 'rails_helper'

describe 'user registration view', type: :feature do

  before(:each) do
    User.create(name: 'Bob', role: 0, password: 'pass')
    visit root_path
  end

  it 'authorizes users with valid information' do
    page.fill_in('Name', with: 'Bob')
    page.fill_in('Password', with: 'pass')
    page.click_button('Login')
    expect(page).to have_content("Bob's Ideas")
  end

  it 'rejects users without a valid password' do
    page.fill_in('Name', with: 'Bob')
    page.click_button('Login')
    expect(current_path).to eq(login_path)
  end

  it 'rejects users without a valid name' do
    page.fill_in('Name', with: 'Bib')
    page.fill_in('Password', with: 'pass')
    page.click_button('Login')
    expect(current_path).to eq(login_path)
  end
end
