class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :destination
      t.string :title

      t.timestamps null: false
    end
  end
end
