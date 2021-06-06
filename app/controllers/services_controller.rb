class ServicesController < ApplicationController

  def new
    @service = Service.new
  end

  def destroy
    Service.find_by_id(params[:id]).destroy
    redirect_to '/services'
  end

  def create
    @service = Service.new(service_params)
    @service.business_owner_id = helpers.current_business_owner.id
    if @service.save
      flash[:notice] = "New service: '#{@service.description}' was added."
      redirect_to new_service_path
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:description, :price, :business_owner_id)
  end

end
