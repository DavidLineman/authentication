class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    @post = user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to dashboards_path
    else
      flash[:alert] = "Unable to save post."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to dashboards_path
    else
      flash[:alert] = "Post could not be updated"
      render :new, status: :unprocessable_entity
    end 
  end

  private 

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
