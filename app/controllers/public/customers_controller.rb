class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def index
    @item = Item.page(params[:page]).per(8)
  end 
  
end
