class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name)
  end
end
