class PlayerController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def select_to_compare
    @players = Player.all.sort_by {|player| player.name.downcase}
  end

  def show
    # SELECT * FROM players where id=params["id"]
    @player = Player.find params["id"]
  end

  def json
    render json: Player.find(params["id"]).to_json
  end

  def search
    render json: Player.search_by_name(params["name"]).to_json
  end

  def stars
    @player = Player.find params["id"]
    render json: { 
      1 => @player.one_stars,
      2 => @player.two_stars,
      3 => @player.three_stars,
      4 => @player.four_stars,
      5 => @player.five_stars,
    }
  end

  def rate
    @player = Player.find params["id"]
    ratings_map = {
      1 => "one_stars",
      2 => "two_stars",
      3 => "three_stars",
      4 => "four_stars",
      5 => "five_stars"
    }
    old_value = params["oldValue"].to_i
    new_value = params["newValue"].to_i
    @player[ratings_map[old_value]] = [@player[ratings_map[old_value]]-1, 0].max if old_value != 0
    @player[ratings_map[new_value]] += 1 if new_value != 0
    @player.save
    render json: {status: :ok}
  end

  def compare
    @player1 = Player.find params[:player1]
    @player2 = Player.find params[:player2]
  end
end
