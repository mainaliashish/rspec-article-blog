class Message < ApplicationRecord
  validates :body, presence: true
  default_scope -> { order(created_at: :desc) }
end
