class Opinion < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 260 }

  def self.get_users_posts(id)
    Opinion.where(user_id: id)
  end

  def self.get_related_opinions(id)
    arr = [id]
    followed = Friendship.where('sender_id = ?', id)
    
    if followed.any?
      followed.each { |follow| arr.push(follow.receiver_id) }
    end

    Opinion.where(user_id: arr).order(created_at: :desc)
  end
end
