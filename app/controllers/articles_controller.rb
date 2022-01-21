class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if (params[:article][:image] != nil )
      monimage = Monimage.new(monimagename: params[:article][:monimagename], image: params[:article][:image])
      @article.monimage = monimage
    end

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if (params[:article][:image] != nil )
      monimage = Monimage.new(titre: params[:article][:monimagename], image: params[:article][:image])
      @article.monimage = monimage
    end

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, image: [])
    end
end
