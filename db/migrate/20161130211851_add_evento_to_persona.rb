class AddEventoToPersona < ActiveRecord::Migration[5.0]
  def change
    add_reference :personas, :evento, foreign_key: true
  end
end
