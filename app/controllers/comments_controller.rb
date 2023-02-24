class CommentsController < ApplicationController
    def create
        article = Article.find(params[:article_id])
        render json: article.comments.create(comment_params)
    end

    def index
        render json: Article.find(params[:article_id]).comments
    end

    def destroy
        article = Article.find(params[:article_id])
        comment = article.comments.find(params[:id])
        comment.destroy
    end

    private
    def comment_params
      params.permit(:commenter, :body, :status, :commenter_id, :commenter_type)
    end
end
