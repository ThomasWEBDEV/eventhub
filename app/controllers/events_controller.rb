class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Événement créé !'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :location, :max_participants)
  end
end
