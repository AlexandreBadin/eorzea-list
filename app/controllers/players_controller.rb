class PlayersController < ApplicationController

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
