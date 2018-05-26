class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_exclusive, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
#    @appointments = Appointment.all 
  end

  def new
    if params[:back]
      @appointment = Appointment.new(appointment_params)
	else
	  @appointment = Appointment.new
    end
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
	@appointment.user_id = current_user.id

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def appointments
    @events = Event.all
	render json: @events #.to_json
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

  end


  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:description, :title, :user_id, :event_id, :start, :end, :appointment_id)
    end

  def admin_exclusive
    unless current_user.admin
	  redirect_to appointments_path
	end
  end

end
