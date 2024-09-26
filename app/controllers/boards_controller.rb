class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :next_state, :future_state, :final_state]

  # POST /boards
  def create
    @board = Board.new(state: params[:state])
    if @board.save
      render json: { board_id: @board.id }, status: :created
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # GET /boards/:id
  def show
    render json: { state: @board.state }
  end

   # GET /boards/:id/next_state
  def next_state
    render json: { state: @board.next_generation! }
  end

   # GET /boards/:id/future_state/:generations
   def future_state
    generations = params[:generations].to_i
    render json: { state: @board.future_state!(generations) }
  end

  # GET /boards/:id/final_state
  def final_state
    begin
      render json: { state: @board.final_state! }
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end
end