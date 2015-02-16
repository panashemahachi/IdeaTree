class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :upvote]

  respond_to :html

  def index

if params[:search]
      @ideas = Idea.search(params[:search]).order("created_at DESC")


    elsif params[:tag]
      @ideas = Idea.tagged_with(params[:tag])

    elsif params[:hot]
      @ideas = Idea.order(:cached_votes_up => :desc)

    elsif params[:most_liked]
      @ideas = Idea.order(:cached_votes_up => :desc)

    else
      @ideas = Idea.order("created_at DESC")
    end
    
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
    @idea.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @idea.downvote_from current_user
    redirect_to :back
  end

  def liked
    #@ideas = @idea.liked_by current_user,  :vote => 'like'
  end

  def follow
    @idea = Idea.find(params[:id])
    current_user.follow(@idea)
    flash[:notice] = "You are now following #{@idea.title}."
    redirect_to :back
  end

  def unfollow
    @idea = Idea.find(params[:id])
    current_user.stop_following(@idea)
    redirect_to :back
  end

  def user_ideas
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :short_description, :description, :tag_list)
    end
end
