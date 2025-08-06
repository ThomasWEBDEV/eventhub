class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @participation = @event.participations.create(user: current_user, status: 'confirmed')
    redirect_to @event, notice: 'Inscription confirmée !'
  end

  def destroy
    @participation = Participation.find(params[:id])
    @event = @participation.event
    @participation.destroy
    redirect_to @event, notice: 'Inscription annulée.'
  end
end
