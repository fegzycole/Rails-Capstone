class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  self.find_user_retweet(user_id, opinion_id)
    Retweet.where(UserId: user_id).where(OpinionId: opinion_id)[0]
  end
end
