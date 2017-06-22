class ArticlesController < ApplicationController

  before_action :set_article, :only => [:show, :edit, :update, :destroy, :image, :download]

  def index
    @articles = Article.includes(:comments).page(params[:page])
  end # #index

  def new
    @article = Article.new
    @article.images.build
  end # #new

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: @article
      end
      format.xml do
        render xml: @article
      end
    end
  end # #show

  def edit
    @article.images.build
  end # #edit

  def update
    if @article.update_attributes(params_create)
      flash[:success] = t('success')
      redirect_to @article
    else
      flash[:errors] 
      render :edit
    end
  end # #update

  def create
    @article = Article.new(params_create)
    if @article.save
      redirect_to  articles_url
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end # #delete

  def image
    send_data(open(@article.image.path).read, type: @article.image_content_type, filename: 'article.png')
  end

  def download
    send_date(@article.to_pdf)
  end # #download

  private

  def params_create
    params.require(:article).permit(:title, :body, :image, images_attributes:[:id, :title, :_destroy])
  end # #permit_create

  def set_article
    @article = Article.find(params[:id])
  end # #set_article


end
