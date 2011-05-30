class CommentsController < ApplicationController
  before_filter :login_required
  respond_to :html, :xml

  def new
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.build
    respond_with @comment
  end

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])

    if @comment.is_minimum_length? && @comment.save
      redirect_to user_post_path(current_user,@post), :notice => "Comment has been created."
    else
      render 'new', :alert => "Comment not created."
    end
  end
end

