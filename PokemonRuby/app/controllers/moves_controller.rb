class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]

  # GET /moves
  # GET /moves.json
  def index
    @moves = Move.all
  end

  # GET /moves/1
  # GET /moves/1.json
  def show
  end

  # GET /moves/new
  def new
    @move = Move.new
  end

  # GET /moves/1/edit
  def edit
  end

  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(move_params)
    if @move.save
      if params[:pokemon_id] != nil
        @pokemon=Pokemon.find(params[:pokemon_id])
        if @pokemon.n_moves < 4
          @pokemon.moves << @move
          @pokemon.n_moves+=1
          @pokemon.save
          if @pokemon.n_moves < 4
            respond_to do |format|
              format.html {
                flash[:notice] = "Add more moves if you want."
                redirect_to :controller => "moves", :action => "new", :id => @pokemon.id
              }
            end
          else
            respond_to do |format|
              format.html { redirect_to @move, notice: 'Move was successfully created.' }
              format.json { render action: 'show', status: :created, location: @move }
            end
          end
        else
          respond_to do |format|
            format.html { redirect_to root_url, notice: 'This pokemon already has 4 moves.' }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to @move, notice: 'Move was successfully created.' }
          format.json { render action: 'show', status: :created, location: @move }
        end
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moves/1
  # PATCH/PUT /moves/1.json
  def update
    respond_to do |format|
      if @move.update(move_params)
        format.html { redirect_to @move, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy
    @move.destroy
    respond_to do |format|
      format.html { redirect_to moves_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_move
      @move = Move.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def move_params
      params.require(:move).permit(:name, :movetype, :category)
    end
end
