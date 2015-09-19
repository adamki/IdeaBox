class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
      flash[:problem] = "please submit an idea"
      redirect_to new_idea_path
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find_by(params[:id])
    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render :edit
    end
  end

  def show
    @idea = Idea.find_by(params[:id])
  end

  def destroy
    @idea = current_user.ideas.find_by(params[:id])
    @idea.delete
    redirect_to ideas_path

  end
  private

  def idea_params
    params.require(:idea).permit(:name)
  end

end
