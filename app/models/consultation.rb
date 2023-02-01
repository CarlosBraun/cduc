class Consultation < ApplicationRecord
    validates_presence_of :start_time, :title, :description
end
