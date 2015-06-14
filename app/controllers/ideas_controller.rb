class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      redirect_to idea_path(@idea)
    else
      flash[:errors] = "Please try again"
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)

    flash.notice = "Idea '#{@idea.title}' Updated"

    redirect_to idea_path(@idea)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    flash.notice = "Idea '#{@idea.title}' Destroyed!"

    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
