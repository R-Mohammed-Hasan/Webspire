module ApplicationHelper

  def is_active(action)
    params[:action] == action ? "active-link" : ""
  end

  def is_messaging(user_id)
     params[:id] == user_id ? "active" : ""
  end

end
