class ActivitiesController < ApplicationController
layout "profile"
  def requests
    requests = FollowRequest.where(receiver_id: @current_user.id)
    render "profile/follow_requests", locals: {requests: requests}
  end

  def accept
    follower = Follower.new(user_id: params[:id], follower_id: @current_user.id)
    follower.save
    request = FollowRequest.where(sender_id: params[:id],receiver_id: @current_user.id)
    request[0].destroy
    Activity.create(user_id: @current_user.id, sender_id: params[:id],activity: "has accepted your friend request")
    redirect_to "/activity/requests", success: "Friend request accepted"
  end
  def reject
    request = FollowRequest.where(sender_id: params[:id],receiver_id: @current_user.id)
    request[0].destroy
    Activity.create(user_id: @current_user.id, sender_id: params[:id],activity: "has rejected your friend request")
    redirect_to "/activity/requests", danger: "Friend request rejected"

  end
end
