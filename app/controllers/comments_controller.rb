class CommentsController < ApplicationController


    def index
      @post = Post.includes(:comments).find_by(id: params[:post_id])
      @comments = Comment.all
    end

    def new
      @post = Post.find_by(id: params[:post_id])
      @comments = Comment.new
    end

    def create

      @post = Post.find_by(id: params[:post_id])
      @comments = Comment.new(comment_params.merge(post_id: params[:post_id]))

      if @comments.save
        flash[:success] = "You've created a new comment."
        redirect_to topic_post_comments_path(@post)
      else
          flash[:danger] = @topic.errors.full_messages
        redirect_to new_topic_post_comments_path(@post)
      end
    end

    def edit
      @comment = Comment.find_by(id: params[:id])
      @post = @comment.post
    end

    def update
      @post = Post.find_by(id: params[:post_id])
      @comment = Comment.find_by(id: params[:id])

      if @comment.update(post_params)
        redirect_to topic_post_comment_path(@post)
      else
        redirect_to edit_topic_post_comment_path(@topic,@post, @comment)
      end
    end

    def destroy
      @comment = Comment.find_by(id: params[:id])
      @post = @comment.topic

      if @comment.destroy
        redirect_to topic_post_comment_path(@post)
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
