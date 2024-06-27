class EventsController < ApplicationController
  def index
    @events = Event.where('date >= ?', DateTime.now.end_of_day + 1.second).order(:date)
    # @events = Event.all
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
    @marker = [{
                  lat: @event.latitude,
                  lng: @event.longitude
    }]
  end


  def create
 
    @theatres = { "Moviemento" => 'Kottbusser Damm 22, 10967 Berlin', "Neues Off cinema" => 'Hermannstraße 20, 12049 Berlin',
      "IL KINO" => 'Nansenstraße 22, 12047 Berlin', "Babylon Kreuzberg" => 'Dresdener Str. 126, 10999 Berlin',
      "Passage Berlin" => 'Karl-Marx-Straße 131, 12043 Berlin', "Filmtheater am Friedrichshain" => 'Bötzowstraße 1-5, 10407 Berlin',
      "Babylon" => 'Rosa-Luxemburg-Straße 30, 10178 Berlin', "Kino Central" => 'Rosenthaler Str. 39, 10178 Berlin',
      "Odeon Berlin" => 'Hauptstraße 116, 10827 Berlin', "Rollberg Kinos" => 'Rollbergstraße 70, 12049 Berlin',
      "b-ware Ladenkino" => 'Gärtnerstraße 19, 10245 Berlin', "Kino International" => 'Karl-Marx-Allee 33, 10178 Berlin'
      }
    @movie = Movie.find(params[:event][:movie])
    @event = Event.new(event_params)
    @event.user = current_user
    @event.theatre = params[:event][:theatre]
    @locevent = params[:event][:theatre]
    @event.location = @theatres[@locevent]
    # @theatre = params[:event][:theatre]
    # @event.location = @theatres[@theatre]
    @event.movie = @movie
    if @event.save
      redirect_to event_path(@event), notice: 'Event was sucessfully created.'
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
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.destroy
    redirect_to events_path, notice: 'Your event was successfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :threatre)
  end
end
