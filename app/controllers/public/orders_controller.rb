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
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end
end
