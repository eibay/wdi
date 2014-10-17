class PuppiesController < ActionController::Base

	def new
	end

	def destroy
		@puppy = Puppy.find(params[:id])
		@puppy.destroy

		redirect_to puppies_path
	end

	def create
		@puppy = Puppy.new(puppy_params)

		@puppy.save
		redirect_to @puppy
	end

	def show
		@puppy = Puppy.find(params[:id])
	end

	def index
		@puppies = Puppy.all
	end

	def edit
		@puppy = Puppy.find(params[:id])
	end

	def update
	  @puppy = Puppy.find(params[:id])
	 
	  if @puppy.update(puppy_params)
	    redirect_to @puppy
	  else
	    render 'edit'
	  end
	end

	private
	  def puppy_params
	    params.require(:puppy).permit(:name, :breed, :cuteness)
	  end

end