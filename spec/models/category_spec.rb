require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    User.create(name: 'Test Name', email: 'test1@gmail.com', password: '123456')
  end

  before(:each) do
    @category = Category.new(user: subject, name: 'Test')
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@category).to be_valid
    end

    it 'Recipe should have a name' do
      expect(@category.name).to be_present
    end

    it 'Recipe should have a user id' do
      expect(@category.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Recipe should belong to a user' do
      @category = Category.reflect_on_association(:user)
      expect(@category.macro).to eq(:belongs_to)
    end
  end
end
