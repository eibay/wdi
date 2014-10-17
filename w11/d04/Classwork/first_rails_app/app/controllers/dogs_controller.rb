class DogsController < ApplicationController

    def index
      @dogs = Dog.all
    end

    def show
      @dog = Dog.find(params[:id])
    end

    def new
    end

    def create

      dog_hash = {
            name: params["name"],
            breed: params["breed"],
            cuteness: params["cuteness"]
        }

        dog = Dog.create(dog_hash)
        redirect_to "/dogs/#{dog.id}"
    end

    # def update
    #   dog = Dog.find_by({id: params[:id]})
    # end

    # def updated
    #   updated_doggy = {
    #         name: params["name"],
    #         breed: params["breed"],
    #         cuteness: params["cuteness"]
    #     }

    #     dog = Dog.find_by({id: params[:id]})
    #     dog.update(updated_doggy)
    # end

    def delete
      @dog = Dog.find(params[:id])
      @dog.destroy
      redirect_to '/dogs'
    end

end