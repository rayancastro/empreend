class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :meetup]
  skip_before_action :require_admin, except: [:admin]

  def home
    @posts = Post.all
    @lead = Lead.new
  end

  def meetup
  end

  def admin
    @progress = Lead.count
  end

end
