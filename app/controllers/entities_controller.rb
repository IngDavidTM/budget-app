class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
    @category = Category.find(params[:category_id])
  end

  def new
    @entity = Entity.new
    @category = Category.find(params[:category_id])
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @entity.category = Category.find(params[:category_id])
    if @entity.save
      redirect_to category_entities_path(params[:category_id])
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
