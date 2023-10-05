class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_products = @order.order_products
    @order_product = OrderProduct.find(@order.id)
  end 

end
