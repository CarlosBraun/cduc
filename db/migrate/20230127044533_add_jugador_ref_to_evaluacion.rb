class AddJugadorRefToEvaluacion < ActiveRecord::Migration[7.0]
  def change
    add_reference :evaluacions, :jugador, null: false, foreign_key: true
  end
end
