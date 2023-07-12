class Public::CartItemsController < ApplicationController

  def index
     #@cart_items = CartItem.all
     @cart_items = current_customer.cart_items
     @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @incart = current_customer.cart_items.find_by(item_id: @cart_item.item_id)

    if @incart
      @sum = @cart_item.amount.to_i + @incart.amount.to_i
      @incart.update(amount: @sum)

    else
      @cart_item.save
    end
    redirect_to cart_items_path

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path

  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
     current_customer.cart_items.destroy_all
     redirect_to cart_items_path
  end

  def subtotal
    item.with_tax_price * amount
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :price)
  end

end
