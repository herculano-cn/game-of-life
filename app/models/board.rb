class Board < ApplicationRecord
  validates :state, presence: true
  

  def next_state!
    self.state = GameOfLife.new(state).next_state
    save!
    self.state
  end

end
