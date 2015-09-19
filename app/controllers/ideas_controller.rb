class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
      raise "HELL!"
      redirect_to ideas_path
    end

  end

  private

  def idea_params
    params.require(:idea).permit(:name)
  end

end
