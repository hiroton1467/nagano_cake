class Public::ItemsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
  end
  
  def index
     @items = Item.all
  end
  
  def with_tax_price
    (price * 1.1).floor
  end
  
end
