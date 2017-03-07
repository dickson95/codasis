class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_rol?(rol_sym)
    roles.any? { |r| r.name.underscore.to_sym == rol_sym }
  end
  
  has_many :assignments
  has_many :roles, :through => :assignments
  
  after_create :asignar_rol_por_defecto
  
  def asignar_rol_por_defecto
    if Rol.find_by_name('usuario') != nil
      Assignment.create(user_id: self.id, rol_id: Rol.find_by_name('usuario').id)
    end
  end
 
end