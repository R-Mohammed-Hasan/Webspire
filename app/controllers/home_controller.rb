class HomeController < ApplicationController
  layout "home"

  def home

  end

  def search
    # get user_id from db and display in url like 'users/:id'
    @search = User.where("user_name LIKE ?", "%#{params[:q]}%")
  end
end
