require 'rails_helper'

RSpec.feature "On Post Show", type: :feature do
  before(:each) do
    @user = create(:user)
    @post = create(:post, user: @user)
    @comment = create(:comment, user: @user, post: @post)
    visit user_post_path(user_id: @user.id, id: @post.id)
  end

  scenario 'can see the post author, title, text' do
    expect(page).to have_content(@post.user.name)
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.body)
  end
  
  scenario 'can see the number of comments and likes' do
    expect(page).to have_content("Comments: #{@post.comments_count}")
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end

  scenario 'can see the first comment author and text on post' do
    expect(page).to have_content(@comment.user.name)
    expect(page).to have_content(@comment.text)
  end
end
