class CarsWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true, retry: true, queue: 'default'

  def perform(id)
    hp = rand(70..180)
    Car.find(id).update(horse_power: hp)
  end
end
