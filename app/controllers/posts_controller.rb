class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :find_post, only: %i(show edit update destroy toggle_hidden)

  def index
    @posts = Post.published.recent
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.posts.create(post_params)
      redirect_to posts_path, notice: "新增成功！"
    else
      render :back
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "编辑成功！"
    else
      render :back
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "删除成功！"
    else
      redirect_to posts_path, alert: "删除失败！"
    end
  end

  def toggle_hidden
    if @post.is_hidden
      @post.publish!
      flash[:notice] = "文章发布成功！"
    else
      @post.hidden!
      flash[:warning] = "文章隐藏成功！"
    end

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = current_user.posts.find(params[:id])
  end
end
