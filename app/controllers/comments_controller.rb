class CommentsController < ApplicationController

    def index
      @post = Post.includes(:comments).find_by(id: params[:post_id])
      @comments = @post.posts.order("created_at DESC")

    end

    def new
      @post = Post.find_by(id: params[:post_id])
      @comment = Comment.new
    end

    def create
      @post = Post.find_by(id: params[:post_id])
      @comment = Comment.new(post_params.merge(post_id: params[:post_id]))

      if @comment.save
        flash[:success] = "You've created a new topic."
        redirect_to post_posts_path(@post)
      else
          flash[:danger] = @topic.errors.full_messages
        redirect_to new_post_post_path(@post)
      end
    end

    def edit
      @comment = Comment.find_by(id: params[:id])
      @post = @commnet.post
    end

    def update
      @post = Post.find_by(id: params[:post_id])
      @comment = Comment.find_by(id: params[:id])

      if @comment.update(post_params)
        redirect_to post_posts_path(@post)
      else
        redirect_to edit_post_posts_path(@post, @comment)
      end
    end

    def destroy
      @comment = Comment.find_by(id: params[:id])
      @post = @comment.topic

      if @comment.destroy
        redirect_to post_posts_path(@post)
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
