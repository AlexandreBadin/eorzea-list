class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def new
    @list = List.find(params[:list_id])
    @player = Player.new

  end

  def create
    @player = Player.new(params_player)
    @list = List.find(params[:list_id])
    @player.list = @list

    if @player.save!
      redirect_to list_path(@list), notice: 'Player was successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @player.update(params_player)
     redirect_to list_path(@player.list), notice: 'Player was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to list_path(@player.list), notice: 'Player was successfully destroyed'
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def params_player
    params.require(:player).permit(:name, :server)
  end

end
