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
    end
   render :confirm
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    cart_items.each do |cart|
      order_products = OrderItem.new
      order_products.item_id = cart.item_id
      order_products.order_id = @order.id
      order_products.order_amount = cart.amount
      order_products.order_cart_item.subtotal = cart_item.subtotal
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
  end
    
  
  private
  def order_params
   
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
   
  end
end
