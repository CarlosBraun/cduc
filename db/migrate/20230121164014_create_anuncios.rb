class CreateAnuncios < ActiveRecord::Migration[7.0]
  def change
    create_table :anuncios do |t|
      t.string :title
      t.text :description
      t.string :categoria
      t.string :remitente

      t.timestamps
    end
  end
end
