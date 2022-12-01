class AddSupportExecutiveRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :support_executive, null: false, foreign_key: true
  end
end
