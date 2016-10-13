#class Assignment < ApplicationRecord
  #belongs_to :user
  #belongs_to :role
#end

class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
