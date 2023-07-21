class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  
  def tax_included
    (price * 1.1).to_i
  end
end
