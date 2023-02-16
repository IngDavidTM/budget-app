require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'Test Name', email: 'test1@gmail.com', password: '123456')
    @category = Category.create(user: @user, name: 'Test')
    @entity = Entity.new(user: @user, name: 'Test', amount: 80)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@entity).to be_valid
    end

    it 'Recipe should have a name' do
      expect(@entity.name).to be_present
    end

    it 'Recipe should have an amount' do
      expect(@entity.amount).to be_present
    end

    it 'Recipe should have a user id' do
      expect(@entity.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Recipe should belong to a user' do
      @entity = Entity.reflect_on_association(:user)
      expect(@entity.macro).to eq(:belongs_to)
    end
  end
end
