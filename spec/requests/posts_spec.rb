require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before :all do
    @user = create(:user)
    @posts = create_list(:post, 3, user: @user)
  end
  describe 'GET users/:user_id/posts/:id' do
    before :each do
      get user_post_path(user_id: @user.id, id: @posts.first.id)
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the posts/show view' do
      expect(response).to render_template('posts/show')
    end

    context 'with render_views enabled' do
      it 'renders view with posts body in the index template' do
        expect(response.body).to include('Comments')
      end
    end
  end

  describe 'GET users/:user_id/posts/new' do
    before :each do
      get new_user_post_path(@user.id)
    end
    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the posts/new view' do
      expect(response).to render_template('posts/new')
    end

    context 'with render_views enabled' do
      it 'renders view with posts body in the index template' do
        expect(response.body).to include('New post')
      end
    end
  end
end
