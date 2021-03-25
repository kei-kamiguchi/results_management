class AddUserRefToWorkResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :work_results, :user, null: false, foreign_key: true
  end
end
