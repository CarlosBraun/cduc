class AddEnameRefToEvaluacions < ActiveRecord::Migration[7.0]
  def change
    add_reference :evaluacions, :ename, null: false, foreign_key: true
  end
end
