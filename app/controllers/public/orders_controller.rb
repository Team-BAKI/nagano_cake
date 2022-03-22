class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @select = params[:select_address].to_i
    if @select == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif @select == 1
      @address = Address.find(params[:order][:select])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif @select == 2
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
    @cart_items = CartItem.where(customer_id: current_customer.id)

    @order.payment_method = params[:payment_method]
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.total_payment = get_total_item_price + 800
    @order.status = 0

    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.amount
        order_detail.making_status = 0
        order_detail.save
      end
    end

    redirect_to complete_orders_path
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :total_paymen, :status)
  end

  def get_total_item_price
    total_item_price = 0
    cart_items = current_customer.cart_items.all
    cart_items.each do |cart_item|
      sum = cart_item.subtotal
      total_item_price += sum
    end
    return total_item_price
  end

end
