class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def self.find_friend_to_unfollow(sender_id, receiver_id)
    Friendship.where('sender_id = ? AND receiver_id = ?', sender_id, receiver_id)[0]
  end
end
