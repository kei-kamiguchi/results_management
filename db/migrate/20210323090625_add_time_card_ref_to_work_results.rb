class AddTimeCardRefToWorkResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :work_results, :time_card, null: false, foreign_key: true
  end
end
