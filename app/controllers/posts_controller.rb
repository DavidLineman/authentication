class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to dashboards_path
    else
      flash[:alert] = "Unable to save post."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find_by(params[:id])
  end

  private 

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
