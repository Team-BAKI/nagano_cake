class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
    @order_details = OrderDetail.where(order_id: XXX)
    @order = Order.find(parms[XXX])
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
