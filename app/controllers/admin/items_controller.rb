class Admin::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  if @item.save
     flash[:notice] = "Item was successfully created."
    redirect_to admin_items_path
  else
     @items = Item.all
     render :index
  end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
   if   @item.update(item_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to admin_items_path
   else
    render :edit
   end
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price)
  end

end
