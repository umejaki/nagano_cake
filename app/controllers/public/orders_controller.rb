class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end 
  
  def confirm
   @order = Order.new(order_params)
    @cart_item = CartItem.all
    @sum = 0
   render :confirm
  end
  
  private
  def order_params
   
    params.require(:order).permit(:payment_method)
   
  end
end
