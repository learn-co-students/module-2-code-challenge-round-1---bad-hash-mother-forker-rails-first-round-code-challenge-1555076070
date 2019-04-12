class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true

    def power_name
       self.power.name.titleize
    end
end
