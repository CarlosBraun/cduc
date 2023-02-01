class CreateEnames < ActiveRecord::Migration[7.0]
  def change
    create_table :enames do |t|
      t.string :title

      t.timestamps
    end
  end
end
