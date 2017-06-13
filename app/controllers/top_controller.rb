class TopController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:back]  #backがあるときは（もどるボタンを押したときは
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end
end
