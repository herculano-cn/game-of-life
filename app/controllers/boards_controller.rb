class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :next_state]

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
    render json: { state: @board.next_state! }
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end
end