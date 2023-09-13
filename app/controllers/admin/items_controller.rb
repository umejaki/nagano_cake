class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
   def create
    @item = Item.new(item_params)
    @item.save
   end
   
   def index
    
    @item = Item.page(params[:page])
   end
  
  private
    def iteme_params
      params.require(:item).permit(:image, :title, :body)
    end
  
end
