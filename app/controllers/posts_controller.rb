class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def show

  end

  def create
    @post = Post.new(post_params)

    if @post.save
      #nese posti osh ruajtur bone redirect to the post iteslf
      redirect_to @post
    else
      #nese jo render new apet
      render 'new'
    end
  end

  def update


    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  def find_post
    @post = Post.find(params[:id])
  end

  private def post_params
    #we are requring for our model these specific records or tables rows
    #it is a security feature of rails tha actually permits these things
    #from being actually input to the form that we create
    #if they arent initialized here you can't actually submit data to the server
    params.require(:post).permit(:title, :content)

  end


end
