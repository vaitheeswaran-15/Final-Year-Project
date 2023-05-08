class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_rich_text :body
end
