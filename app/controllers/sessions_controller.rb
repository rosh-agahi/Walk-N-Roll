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

  def omniauth
    @business_owner = BusinessOwner.find_or_create_by(username: auth[:info][:email]) do |b|
      b.password = SecureRandom.hex
      b.name = auth[:info][:email].split('@')[0]
    end

    Dogwalker.create(:name => "Not Assigned", :business_owner_id => @business_owner.id)
    Dogwalker.create(:name => "#{@business_owner.name} (myself)", :business_owner_id => @business_owner.id)

    session[:business_owner_id] = @business_owner.id

    redirect_to business_owner_path(@business_owner)

  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
