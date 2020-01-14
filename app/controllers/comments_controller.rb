class CommentsController < ApplicationController
  include ApplicationHelper

  before_action :require_user
  before_action :find_comic 

  def new
    @comment = Comment.new
  end 

  def create
    @comment = Comment.new(comment_params)
    @comment.commenter = current_user
    @comment.comic_id = @comic.id 
    if @comment.save
      flash[:success] = "Successfully posted a comment"
      redirect_to comic_path(@comic)
    else
      flash[:danger] = @comment.errors.full_messages.to_sentence
      redirect_to new_comic_comment_path
    end
  end

  def index 
    @comments = Comment.all
  end 

  def edit
    find_comment 
  end 

  def update 
    find_comment 
    if @comment.update(comment_params)
      flash[:success] = "Successfully updated your comment"
      redirect_to comic_path(@comic)
    else
      flash[:danger] = @comment.errors.full_messages.to_sentence
      redirect_to new_comic_comment_path(@comic, @comment)
    end
  end 

  def destroy 
    find_comment
    @comment.destroy
    flash[:notice] = "Comment was deleted"
		redirect_to comic_path(@comic)
  end 

  private 

  def comment_params
    params.require(:comment).permit(:comic_id, :content)
  end

  def find_user 
    @user = User.find(params[:user_id])
  end 

  def find_comic
    @comic = Comic.find(params[:comic_id])
  end 

  def find_comment
    @comment = Comment.find(params[:id])
  end

end  