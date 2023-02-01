class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :mail , :unique => true
      t.string :name
      t.string :last_name
      t.string :telephone

      t.timestamps
    end
  end
end
