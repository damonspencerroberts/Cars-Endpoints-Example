namespace :cars_task do
  task drive_car: :environment do
    CarsService::Intelligence.drive_cars
  end
end
