class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]
  before_action :check_login

  # GET /trainers
  # GET /trainers.json
  def index
    @trainers = Trainer.all
  end

  # GET /trainers/1
  # GET /trainers/1.json
  def show
  end

  # GET /trainers/new
  def new
    if @adm
      @trainer = Trainer.new
    else
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Only the admin can create things." }
        format.json { head :no_content }
      end
    end
  end

  # GET /trainers/1/edit
  def edit
    if !@adm
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Only the admin can edit things." }
        format.json { head :no_content }
      end
    end
  end

  # POST /trainers
  # POST /trainers.json
  def create
    @trainer = Trainer.new(trainer_params)

    respond_to do |format|
      if @trainer.save
        format.html { redirect_to :controller => "bags", :action => "new", :id => @trainer.id }
        format.json { render action: 'show', status: :created, location: @trainer }
      else
        format.html { render action: 'new' }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainers/1
  # PATCH/PUT /trainers/1.json
  def update
    respond_to do |format|
      if @trainer.update(trainer_params)
        format.html { redirect_to @trainer, notice: 'Trainer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainers/1
  # DELETE /trainers/1.json
  def destroy
    if @adm
      @trainer.pokemons.clear
      @trainer.destroy
      respond_to do |format|
        format.html { redirect_to trainers_url }
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
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainer_params
      params.require(:trainer).permit(:name, :city, :badges)
    end

end
