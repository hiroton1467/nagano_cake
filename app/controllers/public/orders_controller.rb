class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @total = params[:total]
  end

  def index
    @orders = Order.all
    @orders = current_customer.orders
    #@order_items = @orders.order_items
  end

  def show
    @order = Order.find(params[:id])
    #@cart_items = current_customer.cart_items.all
  end

  def complete
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items.each do |cart|
      @order_item = OrderItem.new
      @order_item.item_id = cart.item_id
      @order_item.order_id = @order.id
      @order_item.quantity = cart.amount
      @order_item.price = cart.item.price
      @order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.postcode = current_customer.postal_code
    @order.address = current_customer.address
    #@order.name = current_customer.first_name + current_customer.last_name
    @total = params[:order][:total]
    @postage = 800
    @sum = 0
    if params[:order][:address_number] == "1"
      @order.name = current_customer.name
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
      @order.name = Destination.find(params[:order][:destination_id]).name
      @order.address = Destination.find(params[:order][:destination_id]).address
      @order.postcode = Destination.find(params[:order][:destination_id]).postal_code
    elsif params[:order][:address_number] == "3"
      @order.postcode = params[:order][:address_postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:address_name]


    else
      render :new
    end
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end



  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :billing, :postage)
  end

  def address_params
  params.require(:order).permit(:name, :address)
  end
end

 #def create
  # @order = current_customer.orders.new(order_params)
    #@order.name = current_customer.name
     # @order.address = current_customer.address
    #elsif params[:order][:address_number] == "2"
     # @order.name = Address.find(params[:order][:registered]).name
      #@order.address = Address.find(params[:order][:registered]).address
    #elsif params[:order][:address_number] == "3"
      #@order.address = current_customer.addresses.new(address_params)
      #address_new.save
    #else
      #render :new
    #end
  #end