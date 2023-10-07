class Public::CustomersController < ApplicationController
  
  def edit
    @customer = current_customer
  end
  
  def show
    @customer = current_customer
  end
  
  def unsubscribe
    @customer = current_customer
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end 
  
   def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path
   end 
  
     protected
    
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
    
  
end
