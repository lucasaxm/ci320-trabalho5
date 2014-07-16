class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]
  before_action :check_login

  # GET /pokemons
  # GET /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
    pokemon=Pokemon.find(params[:id])
    File.open(Rails.root.join("public","pokedex.txt"), "r") { |file|
      file.each_line do |line|
        name=line.split('-').first
        if name==pokemon.name.downcase
          pokedex=line.split('-')[1].to_s.chomp
          pokedex="0"*(3-pokedex.length)+pokedex
          @imgurl="http://assets22.pokemon.com/assets/cms2/img/pokedex/full/"+pokedex+".png"
          break;
        end
      end
    }
  end

  # GET /pokemons/new
  def new
    if @adm
      @pokemon = Pokemon.new
      @trainers = Trainer.all
    else
      respond_to do |format|
        format.html { redirect_to pokemons_path, notice: "Only the admin can create things." }
        format.json { head :no_content }
      end
    end
  end

  # GET /pokemons/1/edit
  def edit
    if @adm
      @trainers = Trainer.all
    else
      respond_to do |format|
        format.html { redirect_to @pokemon, notice: "Only the admin can edit things." }
        format.json { head :no_content }
      end
    end
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.n_moves=0
    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to :controller => "moves", :action => "new", :id => @pokemon.id }
        format.json { render action: 'show', status: :created, location: @pokemon }
      else
        format.html { render action: 'new' }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to :controller => "moves", :action => "new", :id => @pokemon.id }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    if @adm
      @pokemon.moves.clear
      @pokemon.destroy
      respond_to do |format|
        format.html { redirect_to pokemons_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Only the admin can destroy things." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :pokedex_number, :poketype, :n_moves, :trainer_id)
    end
end
