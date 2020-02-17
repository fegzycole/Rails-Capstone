class RetweetsController < ApplicationController
  def create
    Retweet.create(OpinionId: params[:opinion_id], UserId: current_user.id)
    redirect_to :opinions, action: :index
  end

  def destroy
    @retweet = Retweet.find_user_retweet(current_user.id, params[:opinion_id])
    @retweet.destroy
    redirect_to :opinions, action: :index
  end
end
