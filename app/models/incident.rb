class Incident < ApplicationRecord
    belongs_to :ticket, optional:true
end
