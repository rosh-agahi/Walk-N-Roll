class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create

    @client = Client.new(client_params)
    @client.business_owner_id = session[:business_owner_id]

    if @client.save
      redirect_to business_owner_path(session[:business_owner_id])
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :phonenumber, :address)
  end

end
