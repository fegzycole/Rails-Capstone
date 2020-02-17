class Opinion < ApplicationRecord
  belongs_to :Author, foreign_key: 'AuthorId', class_name: 'User'
  validates :Text, presence: true, length: { maximum: 260 }
  has_many :retweets, foreign_key: 'OpinionId', class_name: 'Retweet'

  def self.get_users_posts(id)
    Opinion.where(AuthorId: id)
  end

  def self.get_related_opinions(id)
    arr = [id]
    followed = Friendship.where(Followerid: id)

    followed.each { |follow| arr.push(follow.Followedid) } if followed.any?

    Opinion.where(AuthorId: arr).order(created_at: :desc)
  end
end
