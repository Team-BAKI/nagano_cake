class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_user.cart_items.destroy_all
  end

  def create
    binding.pry
    @cart_item = CartItem.new(cart_item_params[:item_id])
    @cart_item.customer_id = current_customer.id

    # なんで[:cart_item]がいる？
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).amount += params[:cart_item][:amount].to_i
			current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).save
			flash[:notice] = "Item was successfully added to cart."
			redirect_to cart_items_path
    else @cart_item.save
			flash[:notice] = "New Item was successfully added to cart."
			redirect_to cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
