class Board < ApplicationRecord
  serialize :state, Array

  validates :state, presence: true

  def next_state!
    self.state = GameOfLife.new(state).next_state
    save!
    self.state
  end
end
