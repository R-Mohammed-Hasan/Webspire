class ActivitiesController < ApplicationController
layout "profile"
  def requests
    requests = FollowRequest.where(receiver_id: @current_user.id)
    render "profile/follow_requests", locals: {requests: requests}
  end
end
