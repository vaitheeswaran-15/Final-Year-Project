class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_rich_text :description

  # ====== Validations ======
  validates :description, presence: true
  validates :title, presence: true
end
