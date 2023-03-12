class TeamsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_users do |t|
      t.references :team, index: true
      t.references :user, index: true
    end
    add_foreign_key :teams_users, :users
    add_foreign_key :teams_users, :teams
  end
end
