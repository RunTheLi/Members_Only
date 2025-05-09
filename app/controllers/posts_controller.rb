class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
