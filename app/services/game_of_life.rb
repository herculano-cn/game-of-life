class GameOfLife
  def initialize(state)
    @state = state
  end

  def next_state
    height = @state.length
    width = @state[0].length
    new_state = Array.new(height) { Array.new(width) }

    (0...height).each do |i|
      (0...width).each do |j|
        new_state[i][j] = next_cell_state(i, j)
      end
    end

    new_state
  end

  private

  def next_cell_state(i, j)
    live_neighbours = count_live_neighbours(i, j)

    if @state[i][j] == 1
      live_neighbours.between?(2, 3) ? 1 : 0
    else
      live_neighbours == 3 ? 1 : 0
    end
  end

  
end