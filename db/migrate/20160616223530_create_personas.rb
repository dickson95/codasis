class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :nombres
      t.string :documento
      t.string :empresa
      t.string :email
      t.string :telefono
      t.string :codigo
      t.references :cargo, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
