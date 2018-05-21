class Todo < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :limited_at, presence: true

  enum status: { incomp: 0, comp: 1 }
end