class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end 
  
  def confirm
   @order = Order.new(order_params)
    @cart_item = CartItem.all
    @sum = 0
    if params[:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
    elsif params[:select_address] == "2"
      # 入力したじゅうしょ
    end
   render :confirm
  end
  
  private
  def order_params
   
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
   
  end
end
