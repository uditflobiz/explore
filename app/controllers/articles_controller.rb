class ArticlesController < ApplicationController
  def index
    render json: Article.all
  end

  def show
    render json: Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
        render json: {
            'status': 'processed',
            'id': @article.id
        }
    else
      render json: {
            'status': 'unprocessable_entity'
        }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
        render json: {
            'status': 'processed',
            'id': @article.id
        }
    else
        render json: {
            'status': 'unprocessable_entity'
        }
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if  @article.destroy
        render json: {
            'status': 'processed',
            'id': @article.id
        }
    else
        render json: {
            'status': 'unprocessable_entity'
        }
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
