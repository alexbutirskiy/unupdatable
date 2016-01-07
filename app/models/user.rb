class User < ActiveRecord::Base
  belongs_to :addr, class_name: 'Address'
end
