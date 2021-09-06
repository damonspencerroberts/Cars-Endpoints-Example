module CarsService
    module Intelligence
        extend self

        def drive_cars
            Car.all.each do |car|
                car.drive_car
            end
        end

        def add_horse_power
            Car.all.each do |car|
                CarsWorker.perform_async(car.id)
            end
        end
    end
end
