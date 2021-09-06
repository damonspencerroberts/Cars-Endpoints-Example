class Car < ApplicationRecord
    belongs_to :owner

    def drive_car
        self.update(driven: true)
    end
end
