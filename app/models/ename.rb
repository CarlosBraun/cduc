class Ename < ApplicationRecord
    has_many :evaluacions, dependent: :destroy
    has_many :evaluacion_tecs, dependent: :destroy
end
