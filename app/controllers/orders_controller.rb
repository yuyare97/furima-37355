class OrdersController < ApplicationController
  def index
    @order_buyer = OrderBuyer.all
  end

  def create
  end
end
