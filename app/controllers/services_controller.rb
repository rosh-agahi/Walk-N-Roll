class ServicesController < ApplicationController
  before_action :require_login
  
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
    @service.status = true
    if @service.save
      flash[:notice] = "New service: '#{@service.description}' was added."
      redirect_to services_path
    else
      render :new
    end
  end

  def edit
    @service = Service.find_by_id(params[:id])
  end

  def update
    @service = Service.find_by_id(params[:id])
    @service.update(description: params[:service][:description],price: params[:service][:price])
    flash[:notice] = "Service '#{@service.description}' was archived."
    redirect_to services_path
  end

  def archive
    @service = Service.find_by_id(params[:id])
    if @service.status == true
      @service.update(status: false)
    else
      @service.update(status: true)
    end
    redirect_to services_path
  end


  private

  def service_params
    params.require(:service).permit(:description, :price, :business_owner_id)
  end

  def require_login
    unless helpers.logged_in?
      flash[:notice] = "You must be logged in."
      redirect_to business_owner_login_path
    end
  end
end
