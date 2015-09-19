class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new
    if @idea.save
      raise "WOIOT!"
      redirect_to :ideas_path
    else
      raise "HELL!"
      redirect_to ideas_path
    end

  end
end
