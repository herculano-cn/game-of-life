class Board < ApplicationRecord
  validates :state, presence: true
  
  def next_state!
    self.state = GameService.new(state).next_state
    save!
    self.state
  end

  # Get the state x generations ahead
  def future_state!(generations)
    generations.times { self.next_state! }
    self.state
  end
end
