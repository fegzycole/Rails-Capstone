class Opinion < ApplicationRecord
  belongs_to :Author, foreign_key: 'AuthorId', class_name: 'User'
  validates :Text, presence: true, length: { maximum: 260 }
  has_many :retweets, foreign_key: 'OpinionId', class_name: 'Retweet'

  def self.get_user_retweets(id)
    retweets_arr = []
    Retweet.where(UserId: id).each do |retweet|
      retweets_arr.push(retweet.OpinionId)
    end
    retweets_arr
  end

  def self.get_users_posts(id)
    retweets_arr = Opinion.get_user_retweets(id)
    Opinion.where(AuthorId: id).or(where(id: retweets_arr)).distinct.order(created_at: :desc)
  end

  def self.get_related_opinions(id)
    arr = [id]
    followed = Friendship.where(Followerid: id)
    followed.each { |follow| arr.push(follow.Followedid) } if followed.any?
    retweets_arr = Opinion.get_user_retweets(id)
    Opinion.where(AuthorId: arr).or(where(id: retweets_arr)).distinct.eager_load(:retweets).order(created_at: :desc)
  end
end
