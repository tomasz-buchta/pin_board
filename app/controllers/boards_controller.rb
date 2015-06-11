class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new,:edit,:destroy,:update]
  respond_to :html

  def index
    @boards = Board.paginate(page: params[:page])
    respond_with(@boards)
  end

  def show
    respond_with(@board)
  end

  def new
    @board = Board.new
    respond_with(@board)
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    @board.save
    respond_with(@board)
  end

  def update
    @board.update(board_params)
    respond_with(@board)
  end

  def destroy
    @board.destroy
    respond_with(@board)
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:title, :description)
    end
end
