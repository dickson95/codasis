class Cargo < ApplicationRecord
    
    def self.search(search, page)
      where(['upper(nombre) like ?',
        "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("nombre")
    end
    
    def name
      self.nombre
    end
    
    validates :nombre, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
    validates :nombre, presence: true
    validates :dependencia, presence: true
end
=begin Codigo:
1. Para la paginacion, ordena por nombre. 
2. Valida que el nombre sea unico y que los campos esten llenos. 
3. Para hacer una busqueda del cargo por nombre
=end