class Jugador < ApplicationRecord
    has_one_attached :avatar
    has_many :evaluacions, dependent: :destroy
    has_many :evaluacion_tecs, dependent: :destroy
    validates_presence_of :fecha, :name, :last_name1, :rut, :categoria
end
