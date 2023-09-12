class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
   def create
    @item = Item.new(item_params)
    @pitem.save
   end
  
  private
    def itemes_params
      params.require(:item).permit(:image)
    end
  
end
