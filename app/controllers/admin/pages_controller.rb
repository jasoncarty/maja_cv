class Admin::PagesController < ApplicationController
  before_action :authenticate_user

  layout 'admin'

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end  

  def create
    @page = Page.create(page_params)
    if @page.save
      redirect_to admin_root_path
      flash[:notice] = 'Page saved successfully'
    else
      render action: :new
    end  
  end

  def edit
    @page = Page.find(params[:id])
  end

  def show
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params)
    if @page.save
      redirect_to admin_root_path
      flash[:notice] = 'Page saved successfully'
    else
      render action: :edit
    end  
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_root_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :meta_title, :meta_description, :content, :url, :template)
  end


end
