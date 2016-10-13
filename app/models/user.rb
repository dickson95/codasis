#class User < ApplicationRecord
  # (esta parte si estaba comentada) Include default devise modules. Others available are:
  # (esta parte si estaba comentada):confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
        # :recoverable, :rememberable, :trackable, :validatable
#end

class User < ActiveRecord::Base
  has_many :assignments
  has_many :roles, :through => :assignments
end

def has_role?(role_sym)
  roles.any? { |r| r.name.underscore.to_sym == role_sym }
end
