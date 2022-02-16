class OrdersController < ApplicationController

  def index
    @order = OrderBuyer.all
  end

  def create
  end
end
