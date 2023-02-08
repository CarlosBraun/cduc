class AddJugadorRefToEvaluacionTec < ActiveRecord::Migration[7.0]
  def change
    add_reference :evaluacion_tecs, :jugador, null: false, foreign_key: true
  end
end
