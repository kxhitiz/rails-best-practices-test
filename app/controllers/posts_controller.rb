class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  respond_to :html, :xml

  def index
    @posts = Post.all
    # show all posts that have more than 10 comments
    @popular_posts = Post.popular
    respond_with @posts
  end

  def new
    @post = current_user.posts.new
    respond_with @post
  end

  def create
    @post = current_user.posts.new(params[:post])

    if @post.save
      redirect_to user_post_path(current_user,@post), :notice => "Post has been created."
    else
      render 'new', :alert => "Unable to create new post"
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = @post.comments

    respond_with @post
  end

end

