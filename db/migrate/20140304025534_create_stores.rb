class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :phone
      t.string :phone2
      t.string :email
      t.string :email2

      t.integer :minimum_amount, :default => 10

      t.boolean :offers_services

      t.timestamps
    end
  end
end
