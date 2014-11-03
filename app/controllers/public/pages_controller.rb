class Public::PagesController < ApplicationController
  before_filter :set_layout, only: :show
  layout false, only: :home

  def home

    @page = Page.find_by_title('Home')
  end

  def show

    @page = Page.find_by_url(params[:id])  
    if !@page
      render :error_404, status: 400, layout: false
    end
  end

  def error_404

  end

  private
    def set_layout
      @page = Page.find_by_url(params[:id])
      if !@page.layout.nil?
        @page.layout.nil? ? false : @page.layout 
      end
    end
end
