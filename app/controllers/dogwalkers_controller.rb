class DogwalkersController < ApplicationController

  def new
    @dogwalker = Dogwalker.new
  end

  def destroy
    @dogwalker = Dogwalker.find_by_id(params[:id])
    @dogwalker.appointments.each do |a|
      a.dogwalker_id = Dogwalker.find_by(name: "Not Assigned").id 
      a.save
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

end
