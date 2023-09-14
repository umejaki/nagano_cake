class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
   def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
   end
   
   def index
    @item = Item.page(params[:page])
   end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
    def item_params
      params.require(:item).permit(:image, :name, :introduction, :price)
    end
  
end
