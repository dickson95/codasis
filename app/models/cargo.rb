class Cargo < ApplicationRecord
    
    def self.search(search, page)
        where(['upper(nombre) like ?',
        "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("nombre")
    end
    
    # validamos que el campo no este vacio con presence
    validates :nombre , presence: true
    validates :dependencia , presence: true
    
    def name
        self.nombre
    end
end
