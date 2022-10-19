require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = create(:user)
    @post = create(:post, user: @user)
    @like = Like.new(user: @user, post: @post)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@like).to be_valid
    end

    it 'is not valid without Author' do
      @like.user = nil
      expect(@like).to_not be_valid
    end

    it 'is not valid without Post' do
      @like.post = nil
      expect(@like).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
