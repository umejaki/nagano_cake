class Public::CustomersController < ApplicationController
  
  def edit
    @customer = current_customer
  end
  
  def show
    @customer = current_customer
  end
  
  
   def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
   end 
  
     protected
    
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
    
  
end
