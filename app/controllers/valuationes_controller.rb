class ValuationesController < ApplicationController
  before_action :set_valuation, only: [:show, :edit, :update, :destroy]

  # GET /valuationes
  # GET /valuationes.json
  def index
    @valuationes = Valuation.all
  end

  # GET /valuationes/1
  # GET /valuationes/1.json
  def show
  end

  # GET /valuationes/new
  def new
    @valuation = Valuation.new
  end

  # GET /valuationes/1/edit
  def edit
  end

  # POST /valuationes
  # POST /valuationes.json
  def create
    @valuation = Valuation.new(valuation_params)

    respond_to do |format|
      if @valuation.save
        format.html { redirect_to @valuation, notice: 'Valuation was successfully created.' }
        format.json { render :show, status: :created, location: @valuation }
      else
        format.html { render :new }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valuationes/1
  # PATCH/PUT /valuationes/1.json
  def update
    respond_to do |format|
      if @valuation.update(valuation_params)
        format.html { redirect_to @valuation, notice: 'Valuation was successfully updated.' }
        format.json { render :show, status: :ok, location: @valuation }
      else
        format.html { render :edit }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valuationes/1
  # DELETE /valuationes/1.json
  def destroy
    @valuation.destroy
    respond_to do |format|
      format.html { redirect_to valuationes_url, notice: 'Valuation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valuation
      @valuation = Valuation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valuation_params
      params.require(:valuation).permit(:good_min, :good_max, :level1, :image1, :vuln_min, :vuln_max, :level2, :image2, :low_min, :low_max, :level3, :image3, :low_min, :low_max, :level3, :image4)
    end
end
