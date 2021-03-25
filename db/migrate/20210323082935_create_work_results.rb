class CreateWorkResults < ActiveRecord::Migration[6.0]
  def change
    create_table :work_results do |t|
      t.integer :writing, default: 0
      t.integer :revision, default: 0

      t.timestamps
    end
  end
end
