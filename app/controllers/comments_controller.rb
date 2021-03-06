class CommentsController < ApplicationController
  before_action :require_token

  # create a new comment on a dinner
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.json_hash[:id]
    @comment.dinner_id = params[:id]
    if @comment.valid?
      @comment.save
      render json: @comment.comment_info
    else
      puts @comment.errors.messages.inspect
      render status: :bad_request, json:       {
        errors: @comment.errors.messages
      }
    end
  end

  # update comment (content only)
  def update
    @comment = Comment.find(params[:comment_id])
    @comment.update(comment_params)
    render json: @comment
  end

  # delete comment
  def delete
    @comment = Comment.find(params[:comment_id])
    @comment.delete
    render json: {message: "comment deleted"}
  end

  private

  def comment_params
    params.permit(:content)
  end

end
