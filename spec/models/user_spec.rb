require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  describe 'Module validation' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without valid posts_count attribute' do
      @user.posts_count = 'one'
      expect(@user).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
