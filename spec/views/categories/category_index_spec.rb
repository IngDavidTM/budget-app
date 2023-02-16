require 'rails_helper'

RSpec.describe 'Category', type: :system, js: true do
  describe 'Categories Index' do
    before(:each) do
      @user = User.create(name: 'test', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      @category = Category.create(name: 'CategoryColor', user_id: @user.id)
      sign_in @user
      get categories_path
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'displays the categories' do
      expect(response.body).to include('CategoryColor')
    end

    it 'displays the new category form' do
      expect(response.body).to include('New Category')
    end

    it 'redirects to the new category page' do
      get new_category_path
      expect(response).to have_http_status(200)
    end
  end
end
