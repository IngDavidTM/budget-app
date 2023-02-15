class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(category_entities: [:entity]).where(user_id: current_user.id)
    @total_amount = @categories.map do |category|
      category.category_entities.map do |category_entity|
        category_entity.entity.amount
      end.sum
    end.sum
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
