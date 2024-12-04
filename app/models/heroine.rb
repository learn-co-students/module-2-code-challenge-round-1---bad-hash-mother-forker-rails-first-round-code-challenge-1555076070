class Heroine < ApplicationRecord
    belongs_to :power, optional: true

    validates :super_name, uniqueness: true
end
