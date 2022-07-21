class MessagesController < ApplicationController


  def new
    redirect_to message_path(params[:id])
  end

  def create

  end

end
