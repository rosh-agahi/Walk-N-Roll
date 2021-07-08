class AppointmentsController < ApplicationController
  before_action :require_login

  def new
    @cbo = helpers.current_business_owner
    @services = @cbo.services.all.active
    @dogwalkers = @cbo.dogwalkers.all

    if params[:dog_id]
      @dog = Dog.find_by_id(params[:dog_id])
      @appointment = @dog.appointments.build
    else
      # @clients = @cbo.clients.all
      @dogs = helpers.current_business_owner.dogs #where?
      @appointment = Appointment.new
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.tip = 0
        if @appointment.save
          flash[:notice] = "Appointment was added for #{@appointment.dog.name} on #{@appointment.display_datetime}."
          redirect_to appointments_path
        else
          render :new
        end
  end

  def index
    if params[:client_id]
      @client = Client.find_by_id(params[:client_id])
      @appointments = @client.appointments
    else
      @appointments = helpers.current_business_owner.appointments
    end
  end

  def destroy
    Appointment.find_by_id(params[:id]).destroy
    redirect_to '/appointments'
  end

  def edit
    @appointment = Appointment.find_by_id(params[:id])
    @cbo = helpers.current_business_owner
    @dogwalkers = @cbo.dogwalkers.all

  end

  def update
    @appointment = Appointment.find_by_id(params[:id])
    @appointment.update(dogwalker_id: params[:appointment][:dogwalker_id])
    @appointment.update(tip: params[:appointment][:tip])

    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:apptdate, :service_id, :dog_id, :dogwalker_id, :tip)
  end

  def require_login
    unless helpers.logged_in?
      flash[:notice] = "You must be logged in."
      redirect_to business_owner_login_path
    end
  end

end
