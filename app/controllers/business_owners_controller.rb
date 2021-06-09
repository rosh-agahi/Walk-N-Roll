class BusinessOwnersController < ApplicationController

  def new
    @business_owner = BusinessOwner.new
  end

  def create
    @business_owner = BusinessOwner.new(user_params)

    if @business_owner.save
      session[:business_owner_id] = @business_owner.id

      Dogwalker.create(:name => "Not Assigned", :business_owner_id => @business_owner.id)
      Dogwalker.create(:name => "#{@business_owner.name} (myself)", :business_owner_id => @business_owner.id)
      redirect_to business_owner_path(@business_owner)
    else
      render :new
    end
  end

  def show
    @business_owner = BusinessOwner.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:business_owner).permit(:name, :username, :password, :business_join_code)
  end

end
