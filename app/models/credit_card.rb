require 'safe_update'
class CreditCard < ActiveRecord::Base
  extend SafeUpdate
  belongs_to :addr, class_name: 'Address', safe_update: true
end
