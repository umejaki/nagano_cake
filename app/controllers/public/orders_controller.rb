class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end 
  
  def create
    @order = Order.new(order_params)
    @order_id = customers.id
    @order.save
    redirect_to orders_confirm_path
  end
  
   private

  def order_params
    params.require(:order).permit(:customers_id, :name, :postal_code, :address, :postage, :payment_methods, :payment_amount)
  end
  
end
