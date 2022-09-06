class BookCommentsController < ApplicationController
  def create
    @book= Book.find(params[:book_id])
    @comment = @book.book_comments.new(comment_params)
    @comment.user_id= current_user.id
    if @comment.save
      redirect_to request.referer
    else
      @book_new = Book.new
      @book_comment = @book.comments
      @user = @book.user
      redirect_to new_post_path
    end
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
