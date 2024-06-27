class PagesController < ApplicationController

  def home
    @users = User.all
    @friend = current_user
    @event = Event.new
    @movies = Movie.all
    @events = Event.all
    @events_today = Event.where('date between ? and ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)

    @similar_users = current_user.similar_users
    @similar_users.each_with_index do |user|
      @existing_friendship = Friendship.find_by(user_id: current_user.id, friend_id: user.id) ||
      Friendship.find_by(user_id: user.id, friend_id: current_user.id)

      if @existing_friendship
        @similar_users.delete(user)
      end
    end
  end

  def index
  end

  def user_profile
    @user = current_user
    @my_events = current_user.events
    @attended_events = current_user.event_users
  end

  def user_profile_edit
    @user = current_user
    @my_events = current_user.events
    @attended_events = current_user.event_users
    # redirect_to "/pages/user_profile"
  end

  def profile
    @user = User.find(params[:id])
  end

  def myevents
    @my_events = current_user.events
    @attended_events = current_user.event_users
    @event = Event.new
  end

  def about
  end
end
