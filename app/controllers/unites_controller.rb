class UnitesController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /unites
  # GET /unites.json
  def index
    @unites = Unit.all
  end

  # GET /unites/1
  # GET /unites/1.json
  def show
  end

  # GET /unites/new
  def new
    @unit = Unit.new
  end

  # GET /unites/1/edit
  def edit
  end

  # POST /unites
  # POST /unites.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'La unidad se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unites/1
  # PATCH/PUT /unites/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unidad actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unites/1
  # DELETE /unites/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to unites_url, notice: 'La unidad fue destruida con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :description)
    end
end
