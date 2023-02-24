class ArticlesController < ApplicationController
  
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def index
    @articles = Article.all
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    @article = Article.new(article_params)
    begin
      @article.save!
    rescue ActiveRecord::RecordInvalid => e
      render json:{
        error: @article.errors.full_messages
      }
    end
  end

  def update
    @article = Article.find(params[:id])
    render json: @article.errors unless @article.update(article_params)
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
      params.require(:article).permit(:title, :body, :status, :author_id)
    end
end
