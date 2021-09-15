class ListsController < ApplicationController

  # GET /lists
  def index
    @lists = List.all
    @user = current_user
  end

  # GET /lists/:id
  def show
    @list = List.find(params[:id])
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end
end
