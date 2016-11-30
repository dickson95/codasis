class TypesController < ApplicationController
  before_action :set_typ, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /types
  # GET /types.json
  def index
    @types = Type.all
  end

  # GET /types/1
  # GET /types/1.json
  def show
  end

  # GET /types/new
  def new
    @typ = Type.new
  end

  # GET /types/1/edit
  def edit
  end

  # POST /types
  # POST /types.json
  def create
    @typ = Type.new(typ_params)

    respond_to do |format|
      if @typ.save
        format.html { redirect_to @typ, notice: 'Type was successfully created.' }
        format.json { render :show, status: :created, location: @typ }
      else
        format.html { render :new }
        format.json { render json: @typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    respond_to do |format|
      if @typ.update(typ_params)
        format.html { redirect_to @typ, notice: 'Type was successfully updated.' }
        format.json { render :show, status: :ok, location: @typ }
      else
        format.html { render :edit }
        format.json { render json: @typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @typ.destroy
    respond_to do |format|
      format.html { redirect_to types_url, notice: 'Type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typ
      @typ = Type.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typ_params
      params.require(:typ).permit(:name)
    end
end
