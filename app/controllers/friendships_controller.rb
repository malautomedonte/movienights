class FriendshipsController < ApplicationController

  def index
    @friends = Friendship.where("user_id = ? OR friend_id = ?", current_user.id, current_user.id)
  end

  def create
    friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])
    friendship.pending!
    if friendship.save!
      redirect_to request.referer
    end
  end

  def accept
    friend = Friendship.find(params[:id])
    if @friend.accepted!
      redirect_to profile_path(friend), notice: 'Friend request accepted'
    else
      redirect_to @offer, notice: 'Offer could not be accepted - please try again'
    end
  end

  def reject
    if @offer.rejected!
      redirect_to @offer, notice: 'Offer rejected'
    else
      redirect_to @offer, notice: 'Offer could not be rejected - please try again'
    end
  end

  def friend_requests

  end

  def set_friend

  end
end
