class Usuario < ApplicationRecord
    
    def self.search(search, page)
        where(['upper(usuario) like ?',
        "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("usuario")
    end

#validamos que el dato sea unico    
    validates :usuario, uniqueness: {case_sensitive: false ,message: "Ya esta registrado"}
    
#validamos que el dato sea solo numeros
    validates :usuario, numericality: {case_sensitive: false ,message: "Debe ser el numero de identidad"}
    
    def name
     self.usuario
    end
end
