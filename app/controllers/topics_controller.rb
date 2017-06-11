class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    if params[:back]  #backがあるときは（もどるボタンを押したときは
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def confirm
    @topic = Topic.new(topics_params)
    render :new if @topic.invalid?
  end

  def edit

  end

  def show
  end

  def update
    if @topic.update(topics_params)
      redirect_to topics_path, notice: "編集しました！"
    else
      render 'new'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "削除しました！"
  end

  private
    def topics_params #ストロングパラメータで取得するパラメータを制限する。悪意のあるデータは取得しないように。
      params.require(:topic).permit(:content)
    end
    # privateで定義するのは、他のコントローラ等からメソッドを読み込めないようにするため。
    # blogs_controllerで定義したblogs_paramsをcontacts_controllerで呼び出せてしまうと、contacts_controllerで意図していないパラメータを受け取ることができてしまいます。

    def set_topic
      @topic = Topic.find(params[:id])
    end

end
