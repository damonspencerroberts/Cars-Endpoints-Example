module CarsService
    module Intelligence
        extend self

        def drive_cars
            Car.all.each do |car|
                car.drive_car
            end
        end
    end
end
