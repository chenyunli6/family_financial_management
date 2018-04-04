class HomeController < ApplicationController
  def index
    @posts = Post.published.recent
  end
end
