class Opinion < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 260 }

  def self.get_users_posts(id)
    Opinion.where(user_id: id)
  end
end
