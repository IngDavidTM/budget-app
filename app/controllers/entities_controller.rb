class EntitiesController < ApplicationController
  def index
    @category_entities = CategoryEntity.includes(:entity).where(category_id: params[:category_id])
    @total_amount = @category_entities.map { |category_entity| category_entity.entity.amount }.sum
    @category = Category.find(params[:category_id])
  end

  def new
    @entity = Entity.new
    @category = Category.find(params[:category_id])
  end

  def create
    if params[:category_entities][:category_id].length == 1
      flash[:alert] = 'You must select at least one category'
      redirect_to new_category_entity_path(params[:category_id])
    else
      @entity = Entity.new(entity_params)
      @entity.user = current_user
      if @entity.save
        params[:category_entities][:category_id].each do |category_id|
          CategoryEntity.create(entity_id: @entity.id, category_id:)
        end
        redirect_to category_entities_path(params[:category_id])
      else
        render :new
      end
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, category_entities: %i[category_id entity_id])
  end
end
