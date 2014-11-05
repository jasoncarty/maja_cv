class Public::PagesController < ApplicationController
  
  layout :set_layout, only: :show

  def home
    @page = Page.find_by_title('Home')
  end

  def show
    @page = Page.find_by_url(params[:id])  
    if !@page
      render :error_404, status: 400, layout: false
    end
  end

  private
    def set_layout
      if @page
        @page = Page.find_by_url(params[:id])
        @page.template.nil? ? 'application' : @page.template 
      end
    end
end
