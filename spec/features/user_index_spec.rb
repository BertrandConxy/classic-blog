require 'rails_helper'

RSpec.feature "On root path", type: :feature do
  before(:each) do
    @users = create_list(:user, 3)
    @user = @users.first
    visit root_path
  end
  scenario 'can see the Bloggers text' do
    expect(page).to have_content("Bloggers")
  end
  scenario 'can see the username' do
    expect(page).to have_content(@user.name)
  end

  scenario 'can see the photo' do
    expect(page).to have_css("img")
  end

  scenario 'click profile, redirect to profile page' do
    click_link(@user.name)
    expect(page).to have_current_path("/users/#{@user.id}")
  end
end
