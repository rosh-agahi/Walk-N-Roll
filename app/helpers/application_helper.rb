module ApplicationHelper

  def current_business_owner
    BusinessOwner.find_by_id(session[:business_owner_id])
  end

end
