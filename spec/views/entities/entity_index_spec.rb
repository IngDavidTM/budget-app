require 'rails_helper'

RSpec.describe 'Entity', type: :system, js: true do
  describe 'Entities Index' do
    before(:each) do
      @user = User.create(name: 'test', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      @category = Category.create(name: 'CategoryColor', user_id: @user.id)
      @entity = Entity.create(name: 'EntityColor', amount: 100, user_id: @user.id)
      @category_entity = CategoryEntity.create(category_id: @category.id, entity_id: @entity.id)
      sign_in @user
      get category_entities_path(@category)
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'displays the categories' do
      expect(response.body).to include('EntityColor')
    end

    it 'displays the new category form' do
      expect(response.body).to include('New Transaction')
    end

    it 'redirects to the new entity page' do
      get new_category_entity_path(@category)
      expect(response).to have_http_status(200)
    end
  end
end
