class AppointmentsController < ApplicationController

  def new
    @clients = helpers.current_business_owner.clients.all
    @dogs = Dog.all.select { |d| d.client.business_owner_id == helpers.current_business_owner.id}
    @dogwalkers = helpers.current_business_owner.dogwalkers.all
    @services = helpers.current_business_owner.services.all
    @appointment = Appointment.new
  end

  def create

    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      flash[:notice] = "Appointment was added for #{@appointment.dog.name} on #{@appointment.apptdate}."
      redirect_to new_appointment_path
    else
      flash[:notice] = "please try again"
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:apptdate, :service_id, :dog_id, :dogwalker_id)
  end

end
