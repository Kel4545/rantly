require 'rails-helper'
require 'capybara/rails'
require 'spec_helper'

feature 'Registration' do
  scenario "a user can register" do
    user_views_registration_page
  end

  scenario "user must fill in all fields" do
    user_views_registration_page
    click button "Join"
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Username name can't be blank")
    expect(page).to have_content("Bio can't be blank")
  end
end