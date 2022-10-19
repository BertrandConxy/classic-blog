require 'rails_helper'

RSpec.describe "Users", type: :request do
  before :all do
    @users = create_list(:user, 5)
    @user = @users.first
    @posts = create_list(:post, 3, user: @user)
  end
  describe 'GET /' do
    before :each do
      get root_path
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the users/index view' do
      expect(response).to render_template('users/index')
    end

    context 'with render_views enabled' do
      it 'renders view with home page text in the index template' do
        expect(response.body).to include(@user.name)
      end
    end
  end

  describe 'GET /users/:id' do
    before :each do
      get user_path(id: @user.id)
    end

    it 'responds with status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the users/show view' do
      expect(response).to render_template('users/show')
    end

    context 'with render_views enabled' do
      it 'renders view with User profile text in the show template' do
        expect(response.body).to include(@user.name)
      end

      it 'renders view  with some posts' do
        expect(response.body).to include(user_post_path(user_id: @user.id, id: @posts.first.id))
      end
    end
  end
end
