class CommentsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:destroy]}

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_to("/posts/#{post.id}")
    else
      flash[:notice] = "コメントできませんでした"
      redirect_to("/posts/#{post.id}")
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/#{post.id}")
  end

  def ensure_correct_user
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    if @comment.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
