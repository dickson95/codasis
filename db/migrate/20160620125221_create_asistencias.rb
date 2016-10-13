class CreateAsistencias < ActiveRecord::Migration[5.0]
  def change
    create_table :asistencias do |t|
      t.date :fecha
      t.string :ciudad
      t.string :objetivo
      t.references :persona, foreign_key: true
      t.references :evento, foreign_key: true

      t.timestamps
    end
  end
end
 