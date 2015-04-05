class WikisController < ApplicationController
  def index
    @wikis = Wiki.all 
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
      redirect_to @wiki, notice: "Wiki created sucessfully"
    else
      flash[:error] = "Error, please try again"
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki, notice: "Wiki updated sucessfully"
    else
      flash[:error] = "Error, please try again"
      render :edit
    end
  end
  
  def destroy 
    @wiki = Wiki.find(params[:id])
    title = @wiki.title
    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was deleted sucessfully"
      redirect_to wikis_path
    else
      flash[:error] = "Error, please try again"
      redirect_to :show
    end
  end
  
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
   
  
end
