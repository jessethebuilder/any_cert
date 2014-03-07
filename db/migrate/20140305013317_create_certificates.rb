class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.integer :user_id

      t.float :amount
      t.integer :service_id
      t.integer :service_count

      t.integer :giver_id
      t.string :giver_name
      t.string :give_email

      t.string :recipient_email

      t.timestamps
    end
  end
end
