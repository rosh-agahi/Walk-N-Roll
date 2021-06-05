class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def destroy
    session.delete(:business_owner_id)
    redirect_to '/'
  end

  def create
    @business_owner = BusinessOwner.find_by(username: params[:business_owner][:username])

    if !!@business_owner && @business_owner.authenticate(params[:business_owner][:password])
      session[:business_owner_id] = @business_owner.id
      redirect_to business_owner_path(@business_owner)
    else
      flash[:notice] = "Incorrect log in info. Please try again."
      redirect_to business_owner_login_path
    end
  end


end
