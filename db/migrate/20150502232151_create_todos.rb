class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :finished, :default => false
      t.boolean :priority, :default => false

      t.timestamps null: false
    end
  end
end
