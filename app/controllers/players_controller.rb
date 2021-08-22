class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @players = Player.new
  end

  def create
    @player = Player.new(params_player)
    @player.list = current_user.list
    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(params_player)
    redirect_to players_path
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private

  def params_player
    params.require(:player).permit(:name, :server)
  end

end
