class MovesPokemonsController < ApplicationController
  before_action :set_moves_pokemon, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  before_action :notshow, only: [:index, :edit]

  # GET /moves_pokemons
  # GET /moves_pokemons.json
  def index
    @moves_pokemons = MovesPokemon.all
  end

  # GET /moves_pokemons/1
  # GET /moves_pokemons/1.json
  def show
  end

  # GET /moves_pokemons/new
  def new
    if @adm
      @moves_pokemon = MovesPokemon.new
    else
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Only the admin can associate things." }
        format.json { head :no_content }
      end
    end
  end

  # GET /moves_pokemons/1/edit
  def edit
    if !@adm
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Only the admin can edit things." }
        format.json { head :no_content }
      end
    end
  end

  # POST /moves_pokemons
  # POST /moves_pokemons.json
  def create
    @moves_pokemon = MovesPokemon.new(moves_pokemon_params)
    if @moves_pokemon.save
      pokemon=Pokemon.find(@moves_pokemon.pokemon_id)
      pokemon.n_moves+=1
      pokemon.save
    end
    respond_to do |format|
      if @moves_pokemon.save
        format.html { redirect_to pokemon, notice: 'A new move was learned!' }
        format.json { render action: 'show', status: :created, location: @moves_pokemon }
      else
        format.html { render action: 'new' }
        format.json { render json: @moves_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moves_pokemons/1
  # PATCH/PUT /moves_pokemons/1.json
  def update
    respond_to do |format|
      if @moves_pokemon.update(moves_pokemon_params)
        format.html { redirect_to @moves_pokemon, notice: 'Moves pokemon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @moves_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves_pokemons/1
  # DELETE /moves_pokemons/1.json
  def destroy
    if @adm
      @moves_pokemon.destroy
      respond_to do |format|
        format.html { redirect_to moves_pokemons_url }
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
    def set_moves_pokemon
      @moves_pokemon = MovesPokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moves_pokemon_params
      params.require(:moves_pokemon).permit(:pokemon_id, :move_id)
    end
end
