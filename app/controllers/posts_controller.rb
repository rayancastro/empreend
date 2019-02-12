class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_before_action :require_admin, only: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(display_url: params[:display_url])
    @lead = Lead.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "O post foi criado com sucesso!"
      redirect_to post_path(display_url: @post.display_url)
    else
      flash[:alert] = "Erro na criação do post"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "O post foi atualizado com sucesso!"
      redirect_to post_path(display_url: @post.display_url)
    else
      flash[:alert] = "Erro na edição do post"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "O post foi deletado com sucesso!"
    else
      flash[:alert] = "Erro na exclusão do post"
    end
      redirect_to blog_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :display_url, :user_id, :primary_photo, :primary_photo_cache)
  end

end
