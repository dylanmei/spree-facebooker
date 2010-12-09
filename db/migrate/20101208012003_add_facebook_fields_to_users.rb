class AddFacebookFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_id, :decimal, :precision => 21
    add_column :users, :facebook_link, :string
  end

  def self.down
    remove_column :users, :facebook_id
    remove_column :users, :facebook_link
  end
end
