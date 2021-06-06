class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def create

    @dog = Dog.new(dog_params)
    if @dog.save
      flash[:notice] = "#{@dog.name} was added as a new dog for #{@dog.client.name}."
      redirect_to new_dog_path
    else
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :favorite_treat, :client_id)
  end

end
