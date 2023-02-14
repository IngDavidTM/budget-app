require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    User.create(name: 'Test Name', email: 'test@gmail.com', password: '123456')
  end

  before(:each) do
    @category = Category.new(user: subject, name: 'Test', icon: 'icon image')
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@category).to be_valid
    end

    it 'Recipe should have a name' do
      expect(@category.name).to be_present
    end

    it 'Recipe should have an icon' do
      expect(@category.icon).to be_present
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

    it 'Recipe should have many recipe foods' do
      @category = Category.reflect_on_association(:entities)
      expect(@category.macro).to eq(:has_many)
    end
  end
end
