class Team < ApplicationRecord
  has_and_belongs_to_many :users
  has_rich_text :description

  # ===== Validations =====
  validates :name, presence: true
  validates :description, presence: true
end
