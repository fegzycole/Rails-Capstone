class Retweet < ApplicationRecord
  belongs_to :user, foreign_key: 'UserId', class_name: 'User'
  belongs_to :opinion, foreign_key: 'OpinionId', class_name: 'Opinion'

  def self.find_user_retweet(user_id, opinion_id)
    Retweet.where(UserId: user_id).where(OpinionId: opinion_id)[0]
  end

  def self.retweets_for_post(opinion_id)
    Retweet.where(OpinionId: opinion_id).size
  end
end
