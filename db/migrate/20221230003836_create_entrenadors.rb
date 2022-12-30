class CreateEntrenadors < ActiveRecord::Migration[7.0]
  def change
    create_table :entrenadors do |t|
      t.string :mail
      t.string :name
      t.string :last_name
      t.string :telephone

      t.timestamps
    end
  end
end
