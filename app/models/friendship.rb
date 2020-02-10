class Friendship < ApplicationRecord
  has_many :sender, class_name: 'User'
  has_many :receiver, class_name: 'User'
end
