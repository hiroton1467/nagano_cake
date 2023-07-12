class Public::HomesController < ApplicationController

  def top
   @order_items = OrderItem.all
  end

end
