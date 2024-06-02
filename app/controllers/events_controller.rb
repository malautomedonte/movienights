class EventsController < ApplicationController
  def index
    @events = Event.all
    @events_today = Event.where('date between ? and ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)
    @event = Event.new
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @message = Message.new
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
    @event = Event.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:event][:movie])
    @event = Event.find(params[:id])
    @event.movie = @movie
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.destroy
    redirect_to events_path, notice: 'Your event was successfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
