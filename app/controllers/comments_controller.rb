class CommentsController < ApplicationController
    def create
        puts(params)
        article = Article.find(params[:article_id])
        article.comments.create(comment_params)
    end

    private
    def comment_params
      params.permit(:commenter, :body)
    end
end
