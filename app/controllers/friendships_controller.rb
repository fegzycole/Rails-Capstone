class FriendshipsController < ApplicationController
  def create
    Friendship.create(sender_id: current_user.id, receiver_id: params[:followed_id])
    redirect_to user_path(params[:followed_id])
  end

  def destroy
    @friendship = Friendship.where('sender_id = ? AND receiver_id = ?', current_user.id, params[:followed_id])[0]
    @friendship.destroy
    redirect_to user_path(params[:followed_id])
  end
end
