class Ename < ApplicationRecord
    has_many :evaluacions, dependent: :destroy
    belongs_to :jugador
end
