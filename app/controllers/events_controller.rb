class EventsController < ApplicationController
  before_action :authenticate_user!
# before_action :admin_exclusive, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_event, only: %i(show edit update destroy)

  def index
    @events = Event.all
  end

  def show
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
	else
     @event = Event.new
   end
  end

  def edit
 end

  def create
    @event = Event.new(event_params)
	@event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to controller: 'appointments', action: 'show', id: @appointment.id, notice: 'Event was successfully created.' }
#		format.html { redirect_to "/appointments/#{@appointments.id}" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

#  def appointments
#    @events = Event.all
#	render json: @events #.to_json
  	# render :json => @event
	#binding.pry
  #	respond_to do |format|
  #    format.json {
  #  	  render json:
  #  		@event.to_json(
  #  		  only: [:title, :start, :end]
  #  		)
  #  	}
  #	end

#  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit %i[
      title user_id start end appointment_id
    ]
  end
end
