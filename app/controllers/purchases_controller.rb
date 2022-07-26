class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :move_to_index]

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :street_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
