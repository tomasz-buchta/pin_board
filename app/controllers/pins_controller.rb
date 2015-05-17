class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :set_board

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
    respond_with(@board,@pin)
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
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
      params.require(:pin).permit(:title, :description,:image)
    end
end
