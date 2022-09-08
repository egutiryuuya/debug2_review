class BookCommentsController < ApplicationController
  def create
    @book_comment = BookComment.new
    @book= Book.find(params[:book_id])
    @comments = @book.book_comments.all
    @comment = @book.book_comments.new(comment_params)
    @comment.user_id= current_user.id
    @comment.save
    @book_new = Book.new
    @user = @book.user
  end
  
  def index 
    @book = Book.find(params[:id])
    @comments = @book.comments.all
  end
  
  def destroy
    @books=Book.find(params[:book_id])
    @book_comment=BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    @book_comment = BookComment.new
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
