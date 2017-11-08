class ArticlesController < ApplicationController
  before_action :find_article, only: [:show,:edit,:destroy,:update]


  def new 
    @article = Article.new
  end

  def create

   @article = Article.new(article_params)

   @article.save

   if @article.save 
  flash[:notice]= "Article Created"
  redirect_to article_path(@article)
else 
  render 'new'
end
def show 
  
  end

end
def index
  @articles = Article.all

end
def destroy
  
  @article.destroy
  flash[:message]="Article Destroyed!"
  redirect_to articles_path
end


  def edit 
    
  end

def update
 @article  = Article.find(params[:id])
 if @article.update(article_params)
  flash[:notice]= "Article Successfully Updated"
  redirect_to article_path(@article)
else 
  render 'new'
  end
end



private

def find_article
  @article = Article.find(params[:id])
end

def article_params             
params.require(:article).permit(:title, :description)

end
end
