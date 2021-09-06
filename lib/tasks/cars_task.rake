namespace :cars_task do
  task drive_car: :environment do
    CarsService::Intelligence.drive_cars
  end

  task add_horse_power: :environment do
    CarsService::Intelligence.add_horse_power
  end
end
