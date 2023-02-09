class AddEnameRefToEvaluacionTec < ActiveRecord::Migration[7.0]
  def change
    add_reference :evaluacion_tecs, :ename, null: false, foreign_key: true
  end
end
