class CommentsController < ApplicationController


  def create
    user = User.find_by(id: session[:user_id])
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    @comment.commenter = user.username
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to event_path(@event)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
