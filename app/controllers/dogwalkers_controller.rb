class DogwalkersController < ApplicationController
  before_action :require_login

  def new
    @dogwalker = Dogwalker.new
  end

  def destroy
    @dogwalker = Dogwalker.find_by_id(params[:id])
    @dogwalker.appointments.each do |a|
      a.update(dogwalker_id: helpers.current_business_owner.dogwalkers.find_by(name: "Not Assigned").id)
    end

    @dogwalker.destroy
    redirect_to '/dogwalkers'
  end

  def create

    @dogwalker = Dogwalker.new(dogwalker_params)
    @dogwalker.business_owner_id = helpers.current_business_owner.id

    if @dogwalker.save
      flash[:notice] = "#{@dogwalker.name} was added as a new dog walker."
      redirect_to new_dogwalker_path
    else
      render :new
    end
  end

  def show
    @dogwalker = Dogwalker.find_by_id(params[:id])
  end

  private

  def dogwalker_params
    params.require(:dogwalker).permit(:name)
  end

  def require_login
    unless helpers.logged_in?
      flash[:notice] = "You must be logged in."
      redirect_to business_owner_login_path
    end
  end

end
