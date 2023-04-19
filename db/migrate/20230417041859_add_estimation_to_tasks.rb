class AddEstimationToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :Estimation, :integer
  end
end
