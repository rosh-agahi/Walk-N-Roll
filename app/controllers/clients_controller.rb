class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def index
    # populate based on class method for search
    @clients = Client.search_for_clients(params[:search])

  end

  # unlock github
  # get a new secret
  # model logic in model

  def create

    @client = Client.new(client_params)
    @client.business_owner_id = helpers.current_business_owner.id

    if @client.save
      flash[:notice] = "#{@client.name} was added as a new client."
      redirect_to clients_path
    else
      render :new
    end
  end

  def show
    @client = Client.find_by_id(params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:name, :phonenumber, :address)
  end

end
