class PostsController < ApplicationController
  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  def create
    @post = Post.create(name: params[:name], body: params[:body])

    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(name: params[:name], body: params[:body])

    render json: "#{@post.name} has been updated!"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    render json: "#{@post.name} has been deleted!"
  end
end
