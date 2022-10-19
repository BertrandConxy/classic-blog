require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = create(:user)
    @post = create(:post, user: @user)
  end

  describe "Model validation" do
    it 'is valid with valid attributes' do
      expect(@post).to be_valid
    end

    it 'is not valid without a title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'is valid with title length less than 250' do
      expect(@post.title.length).to be_between(1, 250)
    end

    it 'is not valid without valid comments_count and likes_count attribute' do
      @post.comments_count = 'one'
      @post.likes_count = 'one'
      expect(@post).to_not be_valid
    end

    it 'is not valid without valid comments_count and likes_count integer attribute' do
      expect(@post.comments_count).to be >= 0
      expect(@post.likes_count).to be >= 0
    end
  end

  describe 'Associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
