class ArticlesController < ApplicationController
  def index
    render json: Article.all
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    article = Article.new(article_params)

    if article.save
        render json: {
            'status': 'processed',
            'id': article.id
        }
    else
        render json: article.errors
    end
  end

  def update
    article = Article.find(params[:id])

    if article.update(article_params)
        render json: {
            'status': 'processed',
            'id': article.id
        }
    else
        render json: article.errors.as_json
    end
  end

  def destroy
    article = Article.find(params[:id])
    if  article.destroy
        render json: {
            'status': 'processed',
            'id': article.id
        }
    else
        render json: article.errors.as_json
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
