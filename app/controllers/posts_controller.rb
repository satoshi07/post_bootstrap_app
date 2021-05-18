class PostsController < ApplicationController

  before_action :set_post, only: %i[show edi† update destroy]
  def index
    @posts = Post.order(id: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
      # redirect_to action: :new
    end
  end

  def show
    # @post = Post.find(params[:id])
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
