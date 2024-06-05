class FriendshipsController < ApplicationController
  def index
    #@friends = current_user.friends
    @friends = Friendship.where("user_id = ? OR friend_id = ?", current_user.id, current_user.id)
  end

  def create
    existing_friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:friend_id]) ||
                          Friendship.find_by(user_id: params[:friend_id], friend_id: current_user.id)

    if existing_friendship
      if existing_friendship.status == 'rejected'
        existing_friendship.update(status: 'pending')
      end
      redirect_to request.referer
    else
      friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id], status: 'pending')
      if friendship.save
        redirect_to request.referer, notice: 'Friend request sent'
      else
        redirect_to request.referer, alert: 'Unable to send friend request'
      end
    end
  end

  def accept
    friendship = Friendship.find(params[:id])
    if friendship.update(status: 'accepted')
      redirect_to profile_path(friendship.friend), notice: 'Friend request accepted'
    else
      redirect_to request.referer, alert: 'Unable to accept friend request'
    end
  end

  def reject
    friendship = Friendship.find(params[:id])
    if friendship.update(status: 'rejected')
      redirect_to profile_path(friendship.friend), notice: 'Friend request rejected'
    else
      redirect_to request.referer, alert: 'Unable to reject friend request'
    end
  end

  def friend_requests
    @friend_requests = Friendship.where(friend_id: current_user.id, status: 'pending')
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
