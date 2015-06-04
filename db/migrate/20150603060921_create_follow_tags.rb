class CreateFollowTags < ActiveRecord::Migration
  def change
    create_table :follow_tags do |t|
      t.integer :user_id
      t.string :tag

      t.timestamps null: false
    end
  end
end
