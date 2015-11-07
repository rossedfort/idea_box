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

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :category_id)
  end
end
