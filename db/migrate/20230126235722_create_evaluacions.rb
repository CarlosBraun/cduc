class CreateEvaluacions < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluacions do |t|
      t.string :title
      t.integer :altura
      t.integer :embergadura
      t.integer :peso
      t.integer :max_pres
      t.integer :max_squat
      t.integer :max_dl
      t.integer :max_jump
      t.integer :max_v1
      t.integer :max_v2
      t.time :max_time
      t.timestamps
    end
  end
end
