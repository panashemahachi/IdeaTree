class CommentsController < ApplicationController
	def create
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.create(params[:comment].permit(:comment))
		@comment.save
		
		if @comment.save
			redirect_to idea_path(@idea)
		else
			render 'new'
		end
	end

	def destroy
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])
		@comment.destroy
		redirect_to idea_path(@idea)
	end

	def edit
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to idea_path(@idea)
		else
			render 'edit'
		end
	end
end
