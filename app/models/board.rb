class Board < ApplicationRecord
  belongs_to :user
  validates :user,  presence: true
  validates :name, length: {in: 6..40}, uniqueness: true
  validates :desc,  length: {in: 6..500}
end