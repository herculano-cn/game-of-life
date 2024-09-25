class Board < ApplicationRecord
  serialize :state, Array

  validates :state, presence: true
end
