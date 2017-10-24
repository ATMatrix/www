class HomeController < ApplicationController

  def index
    @post = Post.published.ordered.first

    render "index_#{I18n.locale}"
  end

  def instruction; end
  def refund; end

  # community portal
  def comm_portal; end

  def locale_redirect
    redirect_to "/?locale=#{params[:locale]}"
  end
end
