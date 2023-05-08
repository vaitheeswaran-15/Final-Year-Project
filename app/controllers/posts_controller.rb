class PostsController < ApplicationController
  before_action :set_topic
  before_action :set_post,:set_user, only: %i[ show edit update destroy user_profile]

  # GET /posts or /posts.json
  def index
    @posts = @topic.posts
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = @topic.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @topic.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def user_profile
    @posts_by_user = @created_user.posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_post
      if params[:post_id].present?
        @post = @topic.posts.find(params[:post_id])
      else
        @post = @topic.posts.find(params[:id])
      end
    end

    def set_user
      @created_user = User.find(@post.user_id)
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:topic_id, :user_id, :title, :body)
    end
end
