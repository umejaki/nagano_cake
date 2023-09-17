class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.page(params[:page]).per(10)
  end
  
end