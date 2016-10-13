class Asistencia < ApplicationRecord
  
    belongs_to :persona
    belongs_to :evento
        
    def self.search(search, page)
      where(['upper(fecha) like ?',
      "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("fecha")
    end
    
    # validamos que el campo no este vacio
    validates :fecha , presence: true
    validates :ciudad , presence: true
    validates :persona , presence: true
    validates :evento , presence: true
    
end
