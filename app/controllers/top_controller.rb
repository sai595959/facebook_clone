class TopController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

end
