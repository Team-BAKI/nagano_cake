class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page])
  end

  def show
    @genres = Genre.all
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

  def search
    @genres = Genre.all
    @genre = Genre.find(params[:item_id])
    @items = Item.where(params[:id]).page(params[:page])
  end


end
