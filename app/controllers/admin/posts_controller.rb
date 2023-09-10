class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[edit update show destroy]

  def index
    @posts = Post.all
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      flash.now[:danger] = "Content can't be blank"
      render :edit
    end
  end

  def show; end

  def destroy
    @post.destroy!
    redirect_to admin_posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :post_image, :post_image_cache)
  end
end
