class Evento < ApplicationRecord
    
    def self.search(search, page)
      where(['upper(asunto) like ?',
      "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("asunto")
    end
     
    # validamos que el campo no este vacio con presence
    validates :asunto , presence: true
    validates :fecha , presence: true
    validates :hora , presence: true
    validates :ubicacion, presence: true 
    
    def name
      self.asunto
    end
    
   has_many :personas, :dependent => :destroy
   accepts_nested_attributes_for :personas, allow_destroy: true

   def personas_for_form
     collection = personas.where(evento_id: id)
     collection.any? ? collection : personas.build
   end

end
