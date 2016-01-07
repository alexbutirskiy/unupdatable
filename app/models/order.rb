class Order < ActiveRecord::Base
  belongs_to :bill_addr, class_name: 'Address'
  belongs_to :ship_addr, class_name: 'Address'
end
