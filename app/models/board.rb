class Board < ApplicationRecord
  validates :state, presence: true
  
  def next_generation!
    self.state = GameService.new(state).next_state
    save!
    self.state
  end

  # Get the state x generations ahead
  def future_state!(generations)
    future_state = state
    generations.times { future_state = GameService.new(future_state).next_state }
    self.state = future_state
    save! # Updates only once
    self.state
  end

  # Gets final state (stable or repeating patterns)
  def final_state!(max_generations = 1000)
    previous_states = Set.new
    max_generations.times do
      return self.state if previous_states.include?(state)
      previous_states.add(state.dup) # to avoid duplicates
      self.next_generation!
    end
    raise StandardError, "Max generations reached without a stable state."
  end
end
