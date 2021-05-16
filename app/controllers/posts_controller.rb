class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post, notice: "投稿しました"
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path, alert: "削除しました"
  end

  def edit
    @post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  def update
    @post.update!(post_params)
    redirect_to @post, notice: "更新しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
