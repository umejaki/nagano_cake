class Public::ItemsController < ApplicationController
  
  def index
    @item = Item.page(params[:page]).per(8)
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
  end 
  
end
