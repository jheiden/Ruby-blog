class ArticlesController < ApplicationController

    include ArticlesHelper

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

# body not displayed as it should.

    def create
    @article = Article.new(article_params)
    @article.save
    
    redirect_to article_path(@article)
    end



end
