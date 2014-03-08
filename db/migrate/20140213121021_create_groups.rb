class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :fx

      t.timestamps
    end
    add_index :groups, [:group_name]
  end
end
