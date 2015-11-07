class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:message] = 'Idea Saved!'
      redirect_to @idea
    else
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def index
    @ideas = User.find(session[:user_id]).ideas
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:message] = 'Idea Updated!'
      redirect_to @idea
    else
      flash.now[:errors] = @idea.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    Idea.destroy(params[:id])
    flash[:message] = 'Idea Deleted'
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :category_id)
  end
end
