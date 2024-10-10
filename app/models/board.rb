class Board < ApplicationRecord
  validates :state, presence: true

  MAX_GENERATIONS = 1000

  def next_generation!
    update_state(GameService.new(state).next_state)
    self.state
  end

  # Get the state x generations ahead
  def future_state!(generations)
    future_state = GameService.new(state).future_state(generations)
    update_state(future_state) if future_state != self.state
    self.state
  end

  # Gets final state (stable or repeating patterns)
  def final_state!
    final_state = GameService.new(state).final_state(MAX_GENERATIONS)
    update_state(final_state) if final_state != self.state
    self.state
  end

  private

  def update_state(new_state)
    self.state = new_state
    save!
  end
end
