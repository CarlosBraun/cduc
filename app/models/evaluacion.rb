class Evaluacion < ApplicationRecord
    before_save :set_defaults
    belongs_to :ename , optional: true
    belongs_to :jugador
    validates_presence_of :ename_id
    
    private
    def set_defaults
        self.altura ||= 0
        self.embergadura ||= 0
        self.peso ||= 0
        self.max_pres ||= 0
        self.max_squat ||= 0
        self.max_dl ||= 0
        self.max_jump_incompleto ||= 0
        self.max_jump_completo ||= 0
        self.max_jump_libre ||= 0
        self.max_jump_carrera ||= 0
        self.max_v1 ||= 0
        self.max_v2 ||= 0
        self.max_time ||= "00:00"
    end

end
