class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @eventos = Evento.search(params[:search], params[:page])
  end
  
  def show
   
  end

  def new
    @evento = Evento.new
  end

  def edit
    @evento.fecha.strftime("%d/%m/%Y")
    @evento.hora
    puts "esta es la fecha #{@evento.fecha}"
  end

  def create
    @evento = Evento.new(evento_params)
    respond_to do |format|
      if @evento.save
        format.html { redirect_to eventos_url, notice: 'El evento fue creado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      begin
        if @evento.update(evento_params)
          format.html { redirect_to eventos_url, notice: 'El evento fue modificado correctamente.' }
          format.json { head :no_content }
        else
          format.html { render :edit }
          format.json { render json: @evento.errors, status: :unprocessable_entity }
        end
      rescue
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'El evento fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_evento
      @evento = Evento.find(params[:id])
    end

    def evento_params
      params.require(:evento).permit(:asunto, :fecha, :hora, :ubicacion, :persona_ids => [])
    end    
end
