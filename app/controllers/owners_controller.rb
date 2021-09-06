class OwnersController < ApplicationController
  before_action :find_owner, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @owners = Owner.all
    render json: { status: 200, owners: @owners }
  end

  def show
    render json: { status: 200, owners: find_owner }
  end

  def create
    owner = Owner.new
    owner.full_name = owners_params[:full_name]
    if owner.save!
      render json: { status: 200, message: 'Success adding owner to db' }
    else
      render json: { status: 500, message: 'Issue adding owner to db' }
    end
  end

  def update
    if find_owner.update(full_name: owners_params[:full_name])
      render json: { status: 200, message: 'Success' }
    else
      render json: { status: 500, message: 'Failure' }
    end
  end

  def destroy
    if find_owner.destroy
      render json: { status: 200, message: 'Success' }
    else
      render json: { status: 500, message: 'Failure' }
    end
  end

  private

  def find_owner
    Owner.find(owners_params[:id])
  end

  def owners_params
    params.permit(:id, :full_name)
  end
end
