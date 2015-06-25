class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :set_board
  before_action :authenticate_user!, only: [:edit,:update,:new,:destroy]

  respond_to :html

  def index
    @pins = @board.pins.paginate(page: params[:page])
    respond_with(@board,@pins)
  end

  def show
    respond_with(@board,@pin)
  end

  def new
    @pin = Pin.new
    @pin.board = @board
    respond_with(@board,@pin)
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.board = @board
    @pin.user = current_user
    @pin.save
    respond_with(@board,@pin)
  end

  def update
    @pin.update(pin_params)
    respond_with(@board,@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@board,@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    def pin_params
      params.require(:pin).permit(:title, :description,:image,:user)
    end
end
