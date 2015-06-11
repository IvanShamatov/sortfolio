class CreateWebstudios < ActiveRecord::Migration
  def change
    create_table :webstudios do |t|
      t.string :name
      t.float :average_ticket
      t.integer :city_id
      t.text :description

      t.timestamps null: false
    end
  end
end
