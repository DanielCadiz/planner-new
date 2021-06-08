class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :body
      t.date :deadline
      t.boolean :done

      t.timestamps

      t.references :category
    end
  end
end
