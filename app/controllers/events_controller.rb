class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @events = Event.all
  end

  def show; end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @event.delete
    redirect_to events_path
  end

  def participant
    @event = Event.find(params[:id])
    if current_user.events.include?(@event)
      flash[:danger] = "Already Participanted."
    else
      current_user.events << @event
      flash[:success] = "Participanted Successfully."
    end
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :category, :entry_fees, :starting_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end