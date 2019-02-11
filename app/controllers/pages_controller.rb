class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_before_action :require_admin, except: [:admin]

  def home
    @posts = Post.all
  end

  def admin
  end

end
