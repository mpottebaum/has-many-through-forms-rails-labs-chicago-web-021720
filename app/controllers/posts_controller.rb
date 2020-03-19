class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
    2.times do
      @post.categories.build
    end
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.build_user
    @users = User.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
