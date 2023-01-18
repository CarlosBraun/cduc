class CreateJugadors < ActiveRecord::Migration[7.0]
  def change
    create_table :jugadors do |t|
      t.string :mail
      t.string :name
      t.string :last_name
      t.string :posicion
      t.string :categoria
      t.string :genero
      t.integer :edad
      t.integer :altura
      t.integer :embergadura
      t.integer :peso
      t.string :telephone
      t.string :deuda

      t.timestamps
    end
  end
end
