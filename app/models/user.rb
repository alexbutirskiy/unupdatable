require 'safe_update'

class User < ActiveRecord::Base
  extend SafeUpdate
  belongs_to :addr, class_name: 'Address', safe_update: true
end