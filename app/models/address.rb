class Address < ActiveRecord::Base
  has_many :billing_orders, class_name: 'Order', foreign_key: :bill_addr_id
  has_many :shipping_orders, class_name: 'Order', foreign_key: :ship_addr_id
  has_many :credit_cards, foreign_key: :addr_id
  has_many :users, foreign_key: :addr_id
end
