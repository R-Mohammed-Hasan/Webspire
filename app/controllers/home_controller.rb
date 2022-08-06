class HomeController < ApplicationController
  layout "home"

  before_action :delete_expired_stories

  def delete_expired_stories
    stories = ActiveStorage::Attachment.where(name: "story")
    stories.each do |story|
        if Date.parse(story.created_at.strftime("%Y-%m-%d")) < Date.today
          story.destroy
        end
    end
  end

  def home
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page],per_page: 1)
    respond_to do |format|
      format.html
      format.js
    end
    @users_id = @current_user.friends
  end

  def search
    @users = User.where("user_name LIKE ? OR name LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    @posts = Post.where("description LIKE ? OR created_at", "%#{params[:q]}%","%#{params[:q]}%")
  end

  def searching
    users = User.ransack(user_name_cont: params[:q]).result(distinct: true)
    users = users.map { |user| { name: user.user_name, url: "/profile/#{user.id}",icon: url_for(user.user_profile) } }
    posts = Post.ransack(description_cont: params[:q]).result(distinct: true).map{ |post| {name: post.description,url: "/post/#{post.id}",icon: url_for(post.posts.first)} }
    render json: {users: users[0,5], posts: posts }
  end


end
