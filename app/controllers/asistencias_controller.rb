class AsistenciasController < ApplicationController
  before_action :set_asistencia, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /asistencias
  # GET /asistencias.json
  def index
    #@asistencias = Asistencia.all
    @asistencias = Asistencia.search(params[:search], params[:page])
  end

  # GET /asistencias/1
  # GET /asistencias/1.json
  def show
  end

  # GET /asistencias/new
  def new
    @asistencia = Asistencia.new
  end

  # GET /asistencias/1/edit
  def edit
  end

  # POST /asistencias
  # POST /asistencias.json
  def create
    @asistencia = Asistencia.new(asistencia_params)
    
    respond_to do |format|
      if @asistencia.save
        format.html { redirect_to asistencias_url, notice: 'La asistencia fue creada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @asistencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asistencias/1
  # PATCH/PUT /asistencias/1.json
  def update
    respond_to do |format|
      if @asistencia.update(asistencia_params)
        format.html { redirect_to asistencias_url, notice: 'La asistencia se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @asistencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asistencias/1
  # DELETE /asistencias/1.json
  def destroy
    @asistencia.destroy
    respond_to do |format|
      format.html { redirect_to asistencias_url, notice: 'La asistencia se ha eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asistencia
      @asistencia = Asistencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asistencia_params
      params.require(:asistencia).permit(:fecha, :ciudad, :objetivo, :persona_id, :evento_id)
    end
end
