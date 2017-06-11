module TopicsHelper
  # newアクションのときだけ確認画面に行くようにする
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' #newアクションのときは
      confirm_topics_path #確認画面へ
    elsif action_name == 'edit' 
      topic_path
    end
  end

  def choose_new_or_edit_method
    if action_name == 'new' || action_name == 'confirm'
      {method: "post"}
    elsif action_name == 'edit'
      {method: "patch"}
    end
  end

end
