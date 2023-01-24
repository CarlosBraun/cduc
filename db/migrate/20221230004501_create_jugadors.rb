class CreateJugadors < ActiveRecord::Migration[7.0]
  def change
    create_table :jugadors do |t|
      t.string :mail
      t.string :name
      t.string :name2
      t.string :last_name1
      t.string :last_name2
      t.string :rut
      t.string :posicion
      t.string :categoria
      t.string :genero
      t.integer :altura
      t.integer :embergadura
      t.integer :peso
      t.string :telephone
      t.boolean :deuda
      t.datetime :fecha

      t.timestamps
    end
  end
end
