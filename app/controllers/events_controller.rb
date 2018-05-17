class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_exclusive, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    if params[:back]
      @event = Event.new(event_params)
	else
	  @event = Event.new
	end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
	@event.user_id = current_user.id

    respond_to do |format|
#      binding.pry
      if @event.save
        format.html { redirect_to controller: 'appointments', action: 'show', id: 2, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
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

  # DELETE /events/1
  # DELETE /events/1.json
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

#  binding.pry
#  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
#  binding.pry
    params.require(:event).permit(:title, :user_id, :start, :end, :appointment_id)
  end

	def admin_exclusive
	  unless current_user.admin
        redirect_to events_path
	  end
	end
end
