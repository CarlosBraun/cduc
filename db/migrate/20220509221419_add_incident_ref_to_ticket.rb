class AddIncidentRefToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :incident, null: true, foreign_key: true
  end
end
