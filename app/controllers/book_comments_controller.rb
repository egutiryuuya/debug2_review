class BookCommentsController < ApplicationController
  def create
    @book= Book.find(params[:book_id])
    @comment = @book.comment.new(comment_params)
    @comment.user_id= current_user.id
    if @comment.save
      redirect_to request.referer
    end
    # コメントクリエイトから
  end
  
  def destroy
  end
end
