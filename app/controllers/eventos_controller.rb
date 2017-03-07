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
        asociar_personas
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
      if @evento.update(evento_params)
        desasociar_personas
        asociar_personas
        format.html { redirect_to eventos_url, notice: 'El evento fue modificado correctamente.' }
        format.json { head :no_content }
      else
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
      params.require(:evento).permit(:asunto, :fecha, :hora, :ubicacion)
    end
    
    # Asociar personar a un evento
    # @evento: variable global que debe se declarada con el evento antes de llamar
    # este método
    def asociar_personas
      personas = Persona.where(id: params[:evento][:personas])
      personas.each do |persona|
        persona.update_attribute(:evento, @evento)
      end
    end
    
    # Desasociar personas del evento sobre el que se está trabajando
    # @evento: variable global que debe se declarada con el evento antes de llamar
    # este método
    def desasociar_personas
      personas = @evento.personas.to_ary
      desasociar = comparar_personas_evento(personas)
      desasociar.each do |persona|
        persona.update_attribute(:evento, nil)
      end
    end
    
    # Comparar las personas que tiene un evento con las que son pasadas en el
    # array de los parámetros
    def comparar_personas_evento(personas)
      params[:evento][:personas].each do |id|
        persona = Persona.find(id)
        if personas.include?(persona)
          personas.delete(persona)
        end
      end
      personas
    end
    
end
