class CreateMigrations < ActiveRecord::Migration
  def change
    create_table :migrations do |t|
      t.string :name
      t.string :timestamp
      t.string :content
      t.string :envs

      t.timestamps
    end
  end
end
