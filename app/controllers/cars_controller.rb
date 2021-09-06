class CarsController < ApplicationController
  before_action :find_car, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @cars = Car.all
    render json: { status: 200, cars: @cars }
  end

  def index_by_owner
    owner = Owner.find(cars_params[:owner_id])
    @cars = owner.cars
    render json: { status: 200, cars: @cars, owner: owner }
  end

  def show
    render json: { status: 200, cars: find_car }
  end

  def create
    car = Car.new
    car.color = cars_params[:color]
    car.model = cars_params[:model]
    car.owner = Owner.find(cars_params[:owner_id])
    if car.save!
      render json: { status: 200, message: 'Success adding car to db' }
    else
      render json: { status: 500, message: 'Issue adding car to db' }
    end
  end

  def update
    if find_car.update(color: cars_params[:color], model: cars_params[:model], owner: Owner.find(cars_params[:owner_id]))
      render json: { status: 200, message: 'Success' }
    else
      render json: { status: 500, message: 'Failure' }
    end
  end

  def destroy
    if find_car.destroy
      render json: { status: 200, message: 'Success' }
    else
      render json: { status: 500, message: 'Failure' }
    end
  end

  private

  def find_car
    Car.find(cars_params[:id])
  end

  def cars_params
    params.permit(:id, :owner_id, :color, :model)
  end
end
