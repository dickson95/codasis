class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
      t.string :asunto
      t.date :fecha
      t.time :hora
      t.string :ubicacion

      t.timestamps
    end
  end
end
