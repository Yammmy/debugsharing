class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product_ids

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save!
      redirect_to product_path(@product), notice: '你已评论成功！'
    else
      redirect_to product_path(@product), alert: "评论不能为空！"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product), alert: "你已成功删除评论。"
  end

  private

  def find_product_ids
    @product = Product.find(params[:product_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:product_id, :body, :user_id)
  end
end
