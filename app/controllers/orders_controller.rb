class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order = OrderBuyer.new
  end

  def create
    @order = OrderBuyer.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_buyer).permit(:postcode, :prefecture_id, :city, :address, :apartment_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
    if current_user == @item.user
      redirect_to root_path
    elsif Order.exists?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],   
      currency: 'jpy'                 
    )
  end

end
