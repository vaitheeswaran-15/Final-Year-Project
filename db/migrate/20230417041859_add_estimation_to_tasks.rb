class AddEstimationToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :estimation, :float
  end
end
