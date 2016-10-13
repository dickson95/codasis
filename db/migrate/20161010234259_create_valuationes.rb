class CreateValuationes < ActiveRecord::Migration[5.0]
  def change
    create_table :valuationes do |t|
      t.integer :good_min
      t.integer :good_max
      t.integer :level1
      t.string :image1
      t.integer :vuln_min
      t.integer :vuln_max
      t.integer :level2
      t.string :image2
      t.integer :low_min
      t.integer :low_max
      t.integer :level3
      t.string :image3
      t.integer :low_min
      t.integer :low_max
      t.integer :level3
      t.string :image4

      t.timestamps
    end
  end
end
