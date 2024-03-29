class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :transportation_cost_id, :prefecture_id, :leadtime_id, :price, {images: []}).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @item.user
      redirect_to action: :index
    end
    unless @item.purchase == nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
