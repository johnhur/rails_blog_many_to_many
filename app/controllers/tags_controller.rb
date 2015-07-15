class TagsController < ApplicationController
	before_action :find_tag, only: [:edit, :update]
  def index
  	@tags = Tag.all
  end

  def new
  	@tag = Tag.new
  end

  def edit
  end

  def update
  	@tag.update(tag_params)

  	if @tag.save
  		flash[:success] = "Tag Successfully Updated"
  		redirect_to tags_path
  	else
  		@errors = @tag.errors.full_messages
  		render :edit
  	end

  end


  def show
  end

  private
  def find_tag
  	@tag = Tag.find params[:id]
  end

  def tag_params
  	tag_params = params.require(:tag).permit(:name)
  end

end
