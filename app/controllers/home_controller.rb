class HomeController < ApplicationController
  before_action :set_posts

  def index
  end

  private

  def set_posts
    if user_signed_in?
      @posts = Post.all
    else
      @posts = Post.all.where(public: true)
    end
  end
end
