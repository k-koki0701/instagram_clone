class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :baria_user, only: [:edit, :destroy, :update]

  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  def edit
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end
  private
  def blog_params
    params.require(:blog).permit(:content, :picture, :picture_cache)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def baria_user
    unless Blog.find(params[:id]).user.id.to_i == current_user.id
        redirect_to blogs_path(current_user)
    end
   end
end
