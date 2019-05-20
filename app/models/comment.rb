class Comment < ApplicationRecord
  belongs_to :event
  validates :body, presence: true
  validates :commenter, presence: true
 end
