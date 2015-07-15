class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  	@tags = Tag.all
  end

  def create
  	@post = Post.new post_params
  	@tags = Tag.all

  	if @post.save
  		flash[:success] = "Your post has been saved :)"
			redirect_to root_path
		else
			@errors = @post.errors.full_messages
			render :new
		end
  end

  def edit
  	@tags = Tag.all
  end

  def update
  	@post.update(post_params)
  	if @post.save
  		flash[:success] = "Successfully Updated :)"
  		redirect_to root_path
  	else
  		@errors = @post.errors.full_messages
  		render :new
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path, notice: "#{@post.title} was removed :("
  end


  def show
  	@tags = @post.tags
  end

  private
  def find_post
  	@post = Post.find params[:id]
  end
  def post_params
  	params.require(:post).permit(
  		:title,
  		:content,
  		:author,
  		:tag_ids => []
  		)
  end


end
