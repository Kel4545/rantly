require 'rails-helper'
require 'capybara/rails'
require 'spec_helper'

feature 'Home Page' do

  scenario 'Unregistered user can view homepage' do
    visit root_path
    expect(page).to have_content("Rant.ly")
    expect(page).to have_link("Login")
    expect(page).to have_link("Join")
    expect(page).to have_content("Quote")
  end
end