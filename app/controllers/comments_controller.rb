class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]
    before_action :is_comment_author?, only: %i[ destroy ]

    def create
        @comment = Comment.new(comments_params)
        @comment.user_id = current_user.id

        if @comment.save
            redirect_to idea_path(@comment.idea_id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy

        flash[:notice] = 'your comment has been deleted'
        redirect_to idea_path(@comment.idea_id)
    end

    private

    def is_comment_author?
        @comment = Comment.find(params[:id])

        unless @comment.user_id == current_user.id
            flash[:alert] = 'Access denied as you are not author of this comment'
            redirect_to idea_path, status: :unprocessable_entity
        end
    end

    def comments_params
        params.require(:comment).permit(:user_name, :body, :idea_id)
    end
end
