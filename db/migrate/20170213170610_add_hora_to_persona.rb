class AddHoraToPersona < ActiveRecord::Migration[5.0]
  def change
    add_column :personas, :hora, :date
  end
end
