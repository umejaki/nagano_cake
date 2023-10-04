class Admin::OrdersController < ApplicationController

  def show
    @customer = Customer.find(params[:id]) 
    @order = Order.find(params[:id])
    @order_product = @OrderProduct.find(params[:id])
  end 

end
