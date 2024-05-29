class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end


  def create
    @movie = Movie.find(params[:event][:movie])
    @event = Event.new(event_params)
    @event.user = current_user
    @event.movie = @movie
    if @event.save
      redirect_to events_path, notice: 'Event was sucessfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
