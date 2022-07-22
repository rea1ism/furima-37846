class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :street_number, :building, :phone_number).merge(purchase_id: @purchase.id, user_id: current_user.id)
  end
end
