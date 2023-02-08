class CreateEvaluacionTecs < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluacion_tecs do |t|
      t.string :title
      t.date :fecha
      t.integer :servicio_velocidad
      t.integer :servicio_precision
      t.integer :servicio_consistencia
      t.string :servicio_tipo
      t.integer :ataque_tiempo
      t.integer :ataque_precision
      t.integer :ataque_aproximacion
      t.integer :ataque_torque
      t.integer :armado_tiempo
      t.integer :armado_precision
      t.integer :armado_footwork
      t.integer :armado_desiciones
      t.integer :pase_consistencia
      t.integer :pase_movbalon
      t.integer :pase_plataforma
      t.integer :pase_desiciones
      t.integer :defensa_lectura
      t.integer :defensa_bloque
      t.integer :defensa_campo
      t.integer :defensa_prosicion
      t.integer :valores_cooperacion
      t.integer :valores_responsabilidad
      t.integer :valores_respeto
      t.integer :valores_autonomia
      t.integer :valores_comunicacion
      t.timestamps
    end
  end
end
