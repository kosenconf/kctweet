module ApplicationHelper
  def activated?
    signed_in? && current_user.activated
  end
end
