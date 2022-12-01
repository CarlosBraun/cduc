class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.datetime :creation_date
      t.datetime :resolution_date
      t.string :summary
      t.string :description

      t.timestamps
    end
  end
end
