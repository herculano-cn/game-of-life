class GameOfLifeService
  attr_accessor :grid, :rows, :cols

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @grid = Array.new(rows) { Array.new(cols, 0) }
  end

  # Inicializa o grid com células vivas aleatórias
  def randomize
    @rows.times do |row|
      @cols.times do |col|
        @grid[row][col] = rand(2) # Gera 0 ou 1 (morta ou viva)
      end
    end
  end

  # Conta o número de vizinhos vivos ao redor de uma célula
  def live_neighbors(row, col)
    neighbors = [-1, 0, 1]
    count = 0

    neighbors.each do |i|
      neighbors.each do |j|
        next if i == 0 && j == 0 # Ignora a célula atual
        new_row, new_col = row + i, col + j
        # Checa se o vizinho está dentro dos limites da grade
        if new_row.between?(0, @rows - 1) && new_col.between?(0, @cols - 1)
          count += @grid[new_row][new_col]
        end
      end
    end

    count
  end

  # Aplica as regras do Jogo da Vida para calcular a próxima geração
  def next_generation
    new_grid = Marshal.load(Marshal.dump(@grid)) # Cria uma cópia profunda da grid atual
    debugger
    @rows.times do |row|
      @cols.times do |col|
        neighbors = live_neighbors(row, col)

        if @grid[row][col] == 1
          # Célula viva
          new_grid[row][col] = 0 if neighbors < 2 || neighbors > 3 # Morte por isolamento ou superpopulação
        else
          # Célula morta
          new_grid[row][col] = 1 if neighbors == 3 # Nascimento de nova célula
        end
      end
    end

    @grid = new_grid # Atualiza o grid para a nova geração
  end

  # Exibe a grade no terminal
  def display
    @grid.each do |row|
      puts row.map { |cell| cell == 1 ? 'O' : '.' }.join(' ')
    end
    puts
  end
end

# # Exemplo de uso:
# game = GameOfLife.new(10, 10)
# game.randomize
# game.display

# # Executar algumas gerações
# 10.times do
#   sleep(0.5)
#   game.next_generation
#   game.display
# end
