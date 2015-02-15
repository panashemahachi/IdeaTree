class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :upvote]

  respond_to :html

  def index
    @ideas = Idea.all
    respond_with(@ideas)
  end

  def show
    respond_with(@idea)
  end

  def new
   # @idea = Idea.new
   @idea = current_user.ideas.build
    respond_with(@idea)
  end

  def edit
  end

  def create
    #@idea = Idea.new(idea_params)

    @idea = current_user.ideas.build(idea_params)
    @idea.save
    respond_with(@idea)
  end

  def update
    @idea.update(idea_params)
    respond_with(@idea)
  end

  def destroy
    @idea.destroy
    respond_with(@idea)
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :short_description, :description)
    end
end