class CommentsController < ApplicationController
    def create
        puts(params)
        article = Article.find(params[:article_id])
        render json: article.comments.create(comment_params)
    end

    def show
        render json: Article.find(params[:id]).comments
    end

    def destroy
        article = Article.find(params[:article_id])
        comment = article.comments.find(params[:id])
        comment.destroy
      end

    private
    def comment_params
      params.permit(:commenter, :body, :status)
    end
end
