class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @lists = current_user.lists
    @player = Player.new
  end
end
