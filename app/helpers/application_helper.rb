module ApplicationHelper

  def current_business_owner
    BusinessOwner.find_by_id(session[:business_owner_id])
  end

  def logged_in?
    !!current_business_owner
  end

  def dollar_display(amount)
    ActiveSupport::NumberHelper.number_to_currency(amount, :unit=> "$")
  end

end
