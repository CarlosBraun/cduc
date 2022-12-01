class AddSupportExecutiveRefToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :support_executive, null: false, foreign_key: true
  end
end
