class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page])
  end

  def show
    @genres = Genre.all
    @item = Items.find(params[:id])
  end

  def search
    @genres = Genre.all
    @genre = 
    @items = Item.where(params[:id]).page(params[:page])
  end


end
