class RetweetsController < ApplicationController
  def create
    Retweet.create(OpinionId: params[:opinion_id], UserId: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @retweet = Retweet.find_user_retweet(current_user.id, params[:opinion_id])
    @retweet.destroy
    redirect_back(fallback_location: root_path)
  end
end
