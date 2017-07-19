class MessagesController < ApplicationController

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages  #会話に紐付くメッセージを取得
    if @messages.length > 10  #メッセージ数が10より大きければ、over_tenフラグをたて、メッセージを最新の10に絞る
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m] #そうでなければフラグを立てないで全メッセージを取得
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last #もしメッセージが最新で、
      if @messages.last.user_id != current_user.id  #かつそのメッセが自分のものでなければ
        @messages.last.read = true  #既読にする
      end
    end

    @message = @conversation.messages.build  #一覧画面から新規投稿するためには変数が必要
  end

  def create
    @message = @conversation.messages.build(message_params) #HTTPリクエスト上のパラメータを利用してメッセージを作成
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body,:user_id)
    end

end
