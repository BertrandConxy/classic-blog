require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = create(:user)
    @post = create(:post, user: @user)
    @comment = create(:comment, user: @user, post: @post)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@comment).to be_valid
    end

    it 'is not valid without Author' do
      @comment.user = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid without Post' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid without text' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'is not valid with text length greater than 800' do
      expect(@comment.text.length).to be_between(1, 800)
    end
  end
end
