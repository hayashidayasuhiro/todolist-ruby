class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title, limit: 255
      t.date :limited_at
      t.integer :status, limit: 1
      t.timestamps
    end
  end
end
