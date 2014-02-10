class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :goup_name, default: yes
      t.integer :user_id

      t.timestamps
    end
    add_index :groups, [:goup_name,:user_id ]
  end
end
