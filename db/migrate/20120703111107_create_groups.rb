class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :protected
      t.integer :user_id

      t.timestamps
    end
  end
end
