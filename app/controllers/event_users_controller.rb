class EventUsersController < ApplicationController
  def create
    if current_user
      # raise
      @event = params[:event_id]
      @eventuser = EventUser.new(user_id: current_user.id, event_id: params[:event_id])
      @eventuser.save!
      redirect_to event_path(@event), notice: 'You are going to this event!'
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @eventuser = EventUser.find(params[:eventuser_id])
    @eventuser.destroy
    redirect_to event_path(params[:event_id]), notice: 'Cancelled successfully!'
  end
end
