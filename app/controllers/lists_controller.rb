class ListsController < ApplicationController

  def index
    @lists = List.all
    @user = current_user
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params_list)
    @list.user = current_user
    if @list.save
      redirect_to player_lists_path
    else
      render :new
    end
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end
end
