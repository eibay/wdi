class CarsController < ApplicationController

  def monkey
    render(:monkey, { locals: { cars: Car.all } })

  end
  
  def index
    render(:index, { locals: { cars: Car.all } })

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
  def show
    render(:show, { locals: { car: Car.find(params[:id]) } })
  end

  def update
    car = Car.find(params[:id])

    car.update(make: params[:make], model: params[:model], year: params[:year])

    redirect_to '/cars'
  end

  def destroy
    car = Car.find(params[:id])

    car.destroy

    redirect_to '/cars'
  end
end