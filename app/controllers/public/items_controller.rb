class Public::ItemsController < ApplicationController
  def index
   if params[:item_name] 
    # 検索フォームで入力した商品名をもとにデータを取得
    @serch_item = Item.where('name LIKE ?', '%'+params[:item_name]+'%')
    @item = @serch_item.page(params[:page]).per(8)
   else
    # 今まで通り、一覧表示用のデータを取得
    @item = Item.page(params[:page]).per(8)
   end
  end
  
  
  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
    @cart_item = CartItem.all
  end 
  
end
