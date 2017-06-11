class CreateTopics < ActiveRecord::Migration
  def change  #rollback時の処理を勝手に反転して実行してくれる
    # def up def downはremove_columnのときにつかう
    create_table :topics do |t|
      t.text :content
      

      t.timestamps null: false  #created_atとupdated_atという2つのカラムを追加
    end
  end
end
