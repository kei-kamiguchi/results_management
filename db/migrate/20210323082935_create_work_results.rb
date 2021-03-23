class CreateWorkResults < ActiveRecord::Migration[6.0]
  def change
    create_table :work_results do |t|
      t.integer :writing
      t.integer :revision

      t.timestamps
    end
  end
end
