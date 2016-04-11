class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.find_or_create_by(event_params)
    @event.update_facebook

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.permit(:facebook_id)
    end
end
