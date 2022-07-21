module ApplicationHelper

  def is_active(action)
    params[:action] == action ? "active-link" : ""
  end

  def is_messaging(user_id)
    p "========================================================================="
    p params[:id]
    params[:action] == user_id ? "active" : ""

  end
end
