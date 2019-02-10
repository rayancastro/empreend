class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_before_action :require_admin, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :delete]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "O post foi criado com sucesso!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Erro na criação do post"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "O post foi atualizado com sucesso!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Erro na edição do post"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "O post foi deletado com sucesso!"
    else
      flash[:alert] = "Erro na exclusão do post"
    end
      redirect_to blog_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :display_url, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
