class WikisController < ApplicationController
  def index
    @wikis = Wiki.visible_to(current_user) 
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    if @wiki.save
      redirect_to @wiki, notice: "Wiki created sucessfully"
    else
      flash[:error] = "Error, please try again"
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
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
    authorize @wiki
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
