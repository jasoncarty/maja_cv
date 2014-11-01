class Public::PagesController < ApplicationController
  
  def home
    @page = Page.find_by_title('Home')
  end

  def show
    @page = Page.find_by_url(params[:id])  
    if !@page
      render :error_404, :status => 400
    end
  end

  def error_404

  end
end
