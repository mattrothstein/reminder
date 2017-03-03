class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :body
      t.datetime :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
