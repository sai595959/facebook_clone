class TopController < ApplicationController
  def index
    if params[:back]  #backがあるときは（もどるボタンを押したときは
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end
end
