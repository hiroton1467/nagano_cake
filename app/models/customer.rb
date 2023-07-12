class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :cart_items, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :desnations, dependent: :destroy
         
  def name
    self.last_name + " " + self.first_name
  end
  
  def kana
    self.last_name_kana + " " + self.first_name_kana
  end
  
end
