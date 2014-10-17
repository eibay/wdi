class CarsController < ApplicationController
  def monkey
    render(:monkey, { locals: { cars: Car.all } })
  end

  def create
    Car.create(make: params[:make], model: params[:model], year: params[:year])

    redirect_to '/cars'
    ### AUTOMATICALLY assumes render(:create)
  end

  # private

  # def car_params
  #   params.require(:car).permit(:make)
  # end
end