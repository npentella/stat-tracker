class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @q = Player.ransack(params[:q])
    @players = @q.result(distinct: true)
  end

  def webapp
    
  end

  
  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def mass_update
    params['_json'].each do |player_data|
      player = Player.find_by(name: player_data['name'])
      player.points = player_data["points"]
      player.rebounds = player_data["rebounds"]
      player.assists = player_data["assists"]
      player.blocks = player_data["blocks"]
      player.steals = player_data["steals"]
      player.fouls = player_data["fouls"]
      player.save
    end
  end

  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, :number, :points, :rebounds, :assists, :blocks, :steals, :fouls)
    end
end
