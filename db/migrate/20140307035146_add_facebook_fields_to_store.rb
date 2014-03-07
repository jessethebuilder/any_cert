class AddFacebookFieldsToStore < ActiveRecord::Migration
  def change
    add_column :stores, :facebook_id, :string
    add_column :stores, :facebook_secret, :string
    add_column :stores, :facebook_app_name, :string
  end
end
