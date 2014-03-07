class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description

      t.float :cost_per_service

      t.boolean :active

      t.timestamps
    end
  end
end
