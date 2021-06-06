class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create

    @client = Client.new(client_params)
    @client.business_owner_id = session[:business_owner_id]

    if @client.save
      flash[:notice] = "#{@client.name} was added as a new client."
      redirect_to new_client_path
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :phonenumber, :address)
  end

end
