class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      @item = Item.new(item_params)
      render :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :transportation_cost_id, :prefecture_id, :leadtime_id, :price, :image).merge(user_id: current_user.id)
  end
end
