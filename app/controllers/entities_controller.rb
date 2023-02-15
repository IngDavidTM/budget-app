class EntitiesController < ApplicationController
  def index
    @category_entities = CategoryEntity.includes(:entity).where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])
  end

  def new
    @entity = Entity.new
    @category = Category.find(params[:category_id])
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    if @entity.save
      params[:category_entities][:category_id].each do |category_id|
        CategoryEntity.create(entity_id: @entity.id, category_id: category_id)
      end
      redirect_to category_entities_path(params[:category_id])
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, category_entities: [:category_id, :entity_id])
  end
end
