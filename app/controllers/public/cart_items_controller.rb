class Public::CartItemsController < ApplicationController
  
  def create
    
  end
  
  def index
    @items = Items.all
  end 
  
  private
 
def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end
  
end
