class EventUsersController < ApplicationController
  def create
      @event = params[:event_id]
      @eventuser = EventUser.new(user_id: current_user.id, event_id: params[:event_id])
      respond_to do |format|
        if @eventuser.save
          format.json { render json: { success: true, message: 'You have successfully joined the event.', event_user: @eventuser } }
          format.html { redirect_to event_path(@event), notice: 'You have successfully joined the event.' }
        else
          format.json { render json: { success: false, message: @eventuser.errors.full_messages.join(', ') }, status: :unprocessable_entity }
          format.html { redirect_to event_path(@event), alert: @eventuser.errors.full_messages.join(', ') }
        end
      end
  end

  def destroy
    @eventuser = EventUser.find(params[:eventuser_id])
    if @eventuser.destroy
      respond_to do |format|
        format.json { render json: { success: true, message: "You have successfully cancelled your attendance for the event." } }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, message: @eventuser.errors.full_messages.join(', ') }, status: :unprocessable_entity }
      end
    end
  end
end
