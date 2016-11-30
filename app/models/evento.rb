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
end
