class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.integer :from_user_id
      t.string :text
      t.string :url

      t.timestamps null: false
    end
  end
end
