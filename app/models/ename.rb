class Ename < ApplicationRecord
    has_many :evaluacions, dependent: :destroy
end
