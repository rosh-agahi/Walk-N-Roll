class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to business_owner_path(@business_owner)
    else
      render :new
    end
  end


end
