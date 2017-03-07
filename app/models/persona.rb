class Persona < ApplicationRecord
  belongs_to :cargo
  belongs_to :evento, optional: true
  
  def self.search(search, page)
    where(['upper(nombres) like ?',
    "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("documento")
  end
  
   # Validamos en una expresion regular nuestro email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :documento, :codigo,
                :uniqueness => true
    
    validates :codigo, 
                   :presence => true
    validates :nombres, 
                    :presence => true
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
    return p = number
  end
 
  def show_barcode(code)
     require 'barby'
     require 'barby/barcode/qr_code'
     require 'barby/outputter/svg_outputter'
     require "barby/barcode/code_128"
     barcode = Barby::Code128B.new("#{code}")
     barcode.to_svg(height:30, weight:50)
  end
end
