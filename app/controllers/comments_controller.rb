class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy, :show]



  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @notification = @comment.notifications.build(user_id: @topic.user.id)

    respond_to do |format|
      if @comment.save
        #format.html {redirect_to topic_path(@topic), notice: 'コメントを投稿しました'}
        format.js {render :index}
        unless @comment.topic.user_id == current_user.id
          Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'comment_created', {
            message: 'あなたの投稿にコメントが付きました'
          })
        end
        Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'notification_created', {
          unread_counts: Notification.where(user_id: @comment.topic.user.id, read: false).count
        })
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    set_comment

    respond_to do |format|
      if @comment.destroy
        #format.html { redirect_to blog_path(@blog), notice: 'コメントを削除しました。'}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end

  end

  def edit

          @comment = Comment.find(params[:id])
          @topic = @comment.topic

          if @topic.user_id == current_user.id
          else
            redirect_to topic_path(@comment.topic_id), notice: "編集できません！"
          end
  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_path(@comment.topic_id)
    else
      render 'edit'
    end

  #   respond_to do |format|
  #   if @comment.update(comment_params)
  #     # format.js {render :index}
  #     format.html{redirect_to topic_comments_path, notice: "編集しました！"}
  #   else
  #     format.html {render :new}
  #   end
  # end
  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

end
