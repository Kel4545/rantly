require 'rails_helper'
require 'capybara/rails'

feature 'Home Page' do

  scenario 'Unregistered user can view homepage' do
    visit root_path
    click_on("Rant.ly")
    expect(page).to have_link("Join")
    expect(page).to have_content("Quote")
  end
end