class FriendshipsController < ApplicationController
  def create
    Friendship.create(Followerid: current_user.id, Followedid: params[:followed_id])
    redirect_to user_path(params[:followed_id])
  end

  def destroy
    @friendship = Friendship.find_friend_to_unfollow(current_user.id, params[:followed_id])
    @friendship.destroy
    redirect_to user_path(params[:followed_id])
  end
end
