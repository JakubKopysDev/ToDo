class BoardsController < ApplicationController
  before_action :find_board, only: [:edit, :destroy, :update]

  def index
    @board = current_user.boards.new
    @boards = current_user.boards.all
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.valid?
      @board.save
      redirect_to boards_path
    else
      # render json: [error: "Invalid board: #{@board.errors.messages}"]
      @boards = current_user.boards.all
      render :index
    end
  end

  def edit
  end

  def update
    @board.assign_attributes board_params
    if @board.valid?
      @board.save
      redirect_to boards_path
    else
      render :edit, action: "/boards/#{@board.id}"
    end
  end

  def destroy
    @board.delete
    redirect_to boards_path
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :desc)
  end
end
