class Add2HoraToPersona < ActiveRecord::Migration[5.0]
  def change
     add_column :personas, :hora, :time
  end
end
