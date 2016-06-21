class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def create
  	#@current_user ||= User.find(session[:user_id])
  	post_params = params.require(:post).permit(:title, :description, :image, :user_id, :period_id, :post_date)
    @post = Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
    render :'edit'
  end

  def update
    @post.save
  	@post = Post.find(params[:id])
    if @post.update_attributes(post_params)
  	redirect_to 'show_post_route'
    else
      render 'edit'
    end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  end

end

# private

#     def user_params
#       params.require(:user).permit(:email, :password,
#                                    :password_confirmation)
#     end
# end

##TESTING
