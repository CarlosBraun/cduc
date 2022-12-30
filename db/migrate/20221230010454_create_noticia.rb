class CreateNoticia < ActiveRecord::Migration[7.0]
  def change
    create_table :noticia do |t|
      t.string :titulo
      t.string :texto
      t.string :categoria

      t.timestamps
    end
  end
end
