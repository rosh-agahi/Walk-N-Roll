class DogwalkersController < ApplicationController

  def new
    @dogwalker = Dogwalker.new
  end

  def create

    @dogwalker = Dogwalker.new(dogwalker_params)
    @dogwalker.business_owner_id = session[:business_owner_id]

    if @dogwalker.save
      flash[:notice] = "#{@dogwalker.name} was added as a new dog walker."
      redirect_to new_dogwalker_path
    else
      render :new
    end
  end

  private

  def dogwalker_params
    params.require(:dogwalker).permit(:name)
  end

end
