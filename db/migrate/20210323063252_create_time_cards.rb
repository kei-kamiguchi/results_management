class CreateTimeCards < ActiveRecord::Migration[6.0]
  def change
    create_table :time_cards do |t|
      t.integer :year, limit: 2, null: false
      t.integer :month, limit: 1, null: false
      t.integer :day, limit: 1, null: false
      t.datetime :in_at
      t.datetime :out_at

      t.timestamps
    end
  end
end
