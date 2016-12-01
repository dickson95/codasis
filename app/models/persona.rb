class Persona < ApplicationRecord
  belongs_to :cargo
  belongs_to :evento, optional: true
  
  
  def self.search(search, page)
    where(['upper(codigo) like ?',
    "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("codigo")
  end
    
# validamos que el campo no este vacio

  validates :codigo , presence: true
 
    
# Validamos en una expresion regular nuestro email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  
  # Validamos que el dato sea unico

  validates :documento, uniqueness: {case_sensitive: false ,message: "Ya esta registrado"}
    
  #validamos que el numero de documento tenga solo 10 digitos  
  validates :documento,
                  :presence => true,
                    :length => { maximum: 10 }
                    
  def name
    self.nombres
  end 
    

#metodo para el codigo de barras 
    include HasBarcode


  def self.get_barcode(number)
     require 'barby'
     require 'barby/barcode/qr_code'
     require 'barby/outputter/svg_outputter'
     require "barby/barcode/code_128"
     #obtengo el id del pais y la empresa para armar el codebar
     #se cambia cuando se registre el codebar de la empresa
     return p = number
  end
 
  def show_barcode(code)
     require 'barby'
     require 'barby/barcode/qr_code'
     require 'barby/outputter/svg_outputter'
     require "barby/barcode/code_128"
     barcode = Barby::Code128B.new("#{code}")
     barcode.to_svg(height:60, weight:120)
  end
end
