class GameService
  def initialize(state)
    @state = state
  end

  # Calculates the next state of the board based on the current state
  def next_state
    height = @state.size
    width = @state[0].size
    new_state = Array.new(height) { Array.new(width) }

    (0...height).each do |i|
      (0...width).each do |j|
        live_neighbors = count_live_neighbors(i, j)
        new_state[i][j] = update_cell(@state[i][j], live_neighbors)
      end
    end
    new_state
  end

  # Get the state after x generations
  def future_state(generations)
    future_state = @state
    generations.times do
      future_state = GameService.new(future_state).next_state
    end
    future_state
  end

  # Get the final stable state or repeating pattern
  def final_state(max_generations)
    previous_states = Set.new
    current_state = @state

    max_generations.times do
      return current_state if previous_states.include?(current_state)

      previous_states.add(current_state.dup)
      next_state = GameService.new(current_state).next_state

      return current_state if next_state == current_state # Stable state
      current_state = next_state
    end

    raise StandardError, "Max generations reached without a stable state."
  end

  private

  # Count live neighbors for the given cell
  def count_live_neighbors(x, y)
    directions = [-1, 0, 1]
    live_neighbors = 0
    state_size = @state.size
    width_site = @state[0].size

    directions.each do |dx|
      directions.each do |dy|
        next if dx == 0 && dy == 0
        new_x, new_y = x + dx, y + dy
        if new_x.between?(0, state_size - 1) && new_y.between?(0, width_site - 1)
          live_neighbors += 1 if @state[new_x][new_y] == 1
        end
      end
    end
    live_neighbors
  end

  # Determine if a cell will live or die
  def update_cell(cell, live_neighbors)
    if cell == 1
      live_neighbors.between?(2, 3) ? 1 : 0
    else
      live_neighbors == 3 ? 1 : 0
    end
  end
end
