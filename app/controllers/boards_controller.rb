class BoardsController < ApplicationController
  
  # POST /boards
  def create
    @board = Board.new(state: params[:state])
    if @board.save
      render json: { board_id: @board.id }, status: :created
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end
end