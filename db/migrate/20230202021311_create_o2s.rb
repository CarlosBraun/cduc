class CreateO2s < ActiveRecord::Migration[7.0]
  def change
    create_table :o2s do |t|
      t.string :title
      t.string :categoria
      t.integer :j1
      t.integer :j2
      t.integer :j3
      t.integer :j4
      t.integer :j5
      t.integer :j6
      t.integer :j7
      t.integer :j8
      t.integer :j9
      t.integer :j10
      t.integer :j11
      t.integer :j12
      t.integer :j13
      t.integer :j14
      t.integer :j15
      t.integer :j16
      t.integer :j17
      t.integer :j18
      t.integer :j19
      t.integer :j20
      t.string :torneo
      t.date :fecha
      t.integer :e1
      t.integer :e2
      t.integer :e3
      t.integer :es1
      t.integer :pf1
      t.integer :med_kine1

      t.timestamps
    end
  end
end
