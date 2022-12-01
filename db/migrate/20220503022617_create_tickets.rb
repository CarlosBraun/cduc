class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.datetime :ticket_resolution_date
      t.string :priority
      t.integer :rating
      t.string :state
      t.string :resolution
      t.string :response
      t.string :tags
      t.string :docs

      t.timestamps
    end
  end
end
