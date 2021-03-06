module Api
  class CommentsController < ApiController
    def create
      @comment = currently_signed_in.comments.create(comment_params)
      if @comment.save
        render json: @comment
      else
        render json: "unsuccessful"
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      render json: @comment
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :photo_id)
    end
  end
end
