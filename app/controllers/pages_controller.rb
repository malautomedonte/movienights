class PagesController < ApplicationController

  def home
    @movies = Movie.all
    @events = Event.all
    @events_today = Event.where('date between ? and ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)
  end

  def index
  end

  def user_profile
    @user = current_user
    @my_events = current_user.events
    @attended_events = current_user.event_users
  end


  def profile
    @user = User.find(params[:id])
  end

  def myevents
    @my_events = current_user.events
    @attended_events = current_user.event_users
    @event = Event.new
  end
end
