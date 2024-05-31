module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      event = Event.find(params[:id])
      stream_for event
    end
  end
end
