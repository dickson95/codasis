class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :contraseña

      t.timestamps
    end
  end
end
