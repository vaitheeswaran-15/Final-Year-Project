class Post < ApplicationRecord
  belongs_to :topic
  has_rich_text :body
end
