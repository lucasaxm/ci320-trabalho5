class BagsController < ApplicationController
  before_action :set_bag, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  before_action :notshow, only: [:index]

  # GET /bags
  # GET /bags.json
  def index
    @bags = Bag.all
  end

  # GET /bags/1
  # GET /bags/1.json
  def show
  end

  # GET /bags/new
  def new
    if @adm
      @bag = Bag.new
    else
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Only the admin can create things." }
        format.json { head :no_content }
      end
    end
  end

  # GET /bags/1/edit
  def edit
    if !@adm
      respond_to do |format|
        format.html { redirect_to @bag.trainer, notice: "Only the admin can edit things." }
        format.json { head :no_content }
      end
    end
  end

  # POST /bags
  # POST /bags.json
  def create
    @bag = Bag.new(bag_params)

    if @bag.save
      if params[:trainer_id] != nil
        @trainer=Trainer.find(params[:trainer_id])
        if @trainer.bag.nil?
          @trainer.bag = @bag
          @trainer.save
          respond_to do |format|
            format.html { redirect_to @trainer, notice: 'Trainer successfully created.' }
            format.json { render action: 'show', status: :created, location: @bag }
          end
        else
          respond_to do |format|
            format.html { redirect_to root_url, notice: 'This trainer already has a bag.' }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to @bag, notice: 'Bag was successfully created.' }
          format.json { render action: 'show', status: :created, location: @bag }
        end
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bags/1
  # PATCH/PUT /bags/1.json
  def update
    respond_to do |format|
      if @bag.update(bag_params)
        format.html { redirect_to @bag, notice: 'Bag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bags/1
  # DELETE /bags/1.json
  def destroy
    @bag.destroy
    if @adm
      respond_to do |format|
        format.html { redirect_to bags_url }
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
    def set_bag
      @bag = Bag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bag_params
      params.require(:bag).permit(:pokeballs, :potions, :trainer_id)
    end
end
