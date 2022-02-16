class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderBuyer.new
  end

  def create
    @order = OrderBuyer.new(order_params)
  end


  private

  def order_params
    params.require(:order_buyer).permit(:postcode, :prefecture_id, :city, :address, :apartment_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end



end
