class HomeController < ApplicationController
  def index
    @popular_players = Player.all
  end
end
