class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, null: false, default: "" # SNS上でのUserID
    add_column :users, :provider, :string, null: false, default: "" # どのSNSか
    add_column :users, :image_url, :string

    add_index :users,[:uid, :provider], unique: true
  end
end
