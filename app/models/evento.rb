class Evento < ApplicationRecord
    
    def self.search(search, page)
      where(['upper(asunto) like ?',
         "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("asunto")
    end
     
    validates :asunto, presence: true
    validates :fecha, presence: true
    validates :hora, presence: true
    validates :ubicacion, presence: true 
    
    def name
      self.asunto
    end
    
   has_many :personas
   accepts_nested_attributes_for :personas

   def personas_for_form
     collection = personas.where(evento_id: id)
     collection.any? ? collection : personas.build
   end

=begin
    Se debe reconsiderar el uso de este método pues cambia la fecha y hora para la actual cuando 
    va a ser guardado el evento

    before_create :guardar_por_debajo
    
    def guardar_por_debajo
        Time.zone = "America/Bogota"   # permite atrapar zona horaria de colombia
        # Esta es la linea que impide que un evento sea guardado con la fecha que se le
        # asigna, en vista de que el guarda la fecha que se le dice aquí
        # self.fecha = Time.zone.now.strftime("%Y-%m-%d") #Esto asigna la fecha

        # Esta linea tiene el mismo efecto en la hora
        # self.hora = Time.zone.now.strftime("%H:%M:%S") #Asigna hora
    end
=end
end
