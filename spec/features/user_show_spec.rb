require 'rails_helper'

RSpec.feature ' On User Show page', type: :feature do
  before(:each) do
    @user = create(:user)
    @posts = create_list(:post, 3, user: @user)
    visit user_path(@user)
  end

  scenario 'can see the username, photo and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_css('img')
    expect(page).to have_content(@user.bio)
  end

  scenario 'can see three posts' do
    expect(page).to have_content(@posts.first.title)
    expect(page).to have_content(@posts.last.title)
  end

  scenario 'click one post, redirect to users post page' do
    click_link(@posts.first.title)
    @post = @user.posts.find_by(title: @posts.first.title)
    expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
  end
end
