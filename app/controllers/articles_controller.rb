class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def show
      @article = Article.find(params[:id])
      @comment = Comment.new
      @comment.article_id = @article_id
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      flash[:notice] = "Article '@article.title' deleted!"
      
      redirect_to articles_path
    end

    def create
      @article = Article.new(article_params)
      @article.save

      flash[:notice] = "Article '@article.title' created!"
      redirect_to article_path(@article)
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      @article.update(article_params)
      @article.save

      flash[:notice] = "Article '#{@article.title}' updated!"

      redirect_to article_path(@article)
    end

    def tag_list
      @article = Article.find(params[:id])
      @article.tags.collect do |tag|
        tag.name
      end.join(", ")
    end

end
