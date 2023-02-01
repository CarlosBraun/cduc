class Jugador < ApplicationRecord
    has_one_attached :avatar
    has_many :evaluacions
end
