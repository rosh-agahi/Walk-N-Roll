class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create

    @client = Client.new(client_params)
    @client.business_owner_id = helpers.current_business_owner

    if @client.save
      flash[:notice] = "#{@client.name} was added as a new client."
      redirect_to new_client_path
    else
      render :new
    end
  end

  def showdogs
    @client = Client.find_by_id(params[:id])
    render :showdogs
  end

  private

  def client_params
    params.require(:client).permit(:name, :phonenumber, :address)
  end

end
