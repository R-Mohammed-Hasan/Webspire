module ApplicationHelper

  def is_active(action)

    params[:action] == action ? "active-link" : ""

  end

end

