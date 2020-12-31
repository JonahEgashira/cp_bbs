class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to("/posts/#{post.id}")
    else
      flash[:success] = "コメントできませんでした"
      redirect_to("/posts/#{post.id}")
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
