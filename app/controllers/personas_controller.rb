class PersonasController < ApplicationController
    before_action :set_persona, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
                      
    def index
      @personas = Persona.search(params[:search], params[:page])
    end
    
   #para generar el pdf 
    def show
      @evento = Evento.where('id = ?', @persona.evento_id).last
      respond_to do |format|
        format.js
        format.html
        format.pdf do
          render :pdf => "Reporte Nro #{@persona.id}",
          :disposition => 'inline',
          layout: 'pdf.html',
          :template => 'personas/pdf_show.pdf.erb',
          :show_as_html => params[:debug].present?
        end
      end
    end
    
    def new
      @persona = Persona.new
    end
                    
    def edit
    end
                    
    def create
      @persona = Persona.new(persona_params)
      respond_to do |format|
        if @persona.save
          format.html { redirect_to personas_url, notice: 'El registro fue creado satisfactoriamente.' }
          format.json { head :no_content }
        else
          format.html { render :new }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
      end
    end
                    
    def update
      respond_to do |format|
        if @persona.update(persona_params)
          format.html { redirect_to personas_url, notice: 'El registro fue actualizado correctamente.' }
          format.json { head :no_content }
        else
          format.html { render :edit }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
      end
    end
                    
    def destroy
      @persona.destroy
      respond_to do |format|
        format.html { redirect_to personas_url, notice: 'El registro fue eliminado correctamente.' }
        format.json { head :no_content }
      end
    end
                     
    def buscar_persona
      persona = Persona.where("codigo = ? OR documento = ? ", params[:codigo], params[:documento]).limit(1).first
      respond_to do |format|
        format.json{ render json: persona }
      end
    end
                     
    private
                
    def set_persona
      @persona = Persona.find(params[:id])
    end
                
    def persona_params
      params.require(:persona).permit(:hora, :nombres, :documento, :empresa, :email, :telefono, :codigo, :cargo_id, :usuario_id)
    end
    
end
