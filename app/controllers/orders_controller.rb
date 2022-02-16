class OrdersController < ApplicationController

  def index
    @order = OrderBuyer.new
  end

  def create
  end
end
