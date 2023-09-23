class Public::CartItemsController < ApplicationController
  
  def create
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     @cart_item.item_id = cart_item_params[:item_id]
     @cart_item.save
     redirect_to cart_items_path
  end
  
  def index
    @cart_item = CartItem.all
    @sum = 0
  end 
  
   def destroy
    cart_item = @item
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_item.destroy_all
    redirect_to cart_items_path
  end
  
  private
 
def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end
  
end
