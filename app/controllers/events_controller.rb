class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :time, :location)
  end
end
