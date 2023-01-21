class CreateHorarios < ActiveRecord::Migration[7.0]
  def change
    create_table :horarios do |t|
      t.string :title
      t.string :categoria
      t.string :lugar
      t.string :dia
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
