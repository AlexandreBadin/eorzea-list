class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  #  GET /lists/:list_id/players/new
  def new
    @list = List.find(params[:list_id])
    @player = Player.new

  end

  # POST /lists/:list_id/players
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

  # GET /players/:id/edit
  def edit
  end

  # PATCH /players/:id
  def update
    if @player.update(params_player)
     redirect_to list_path(@player.list), notice: 'Player was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /players/:id
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
