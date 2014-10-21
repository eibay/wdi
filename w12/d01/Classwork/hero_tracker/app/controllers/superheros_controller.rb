class SuperherosController < ApplicationController

	# def validate_hash(hash)
	# 	valid = true
	# 	Superhero.attribute_names.each do |attr|
	# 		unless ["created_at", "updated_at", "id"].include?(attr)
	# 			valid = false unless hash.keys.include?(attr)
	# 		end
	# 	end
	# 	valid = false if hash.values.include?("")
	# 	return valid
	# end



	def index
		superheros = Superhero.all
		respond_to do |format|
			format.html { render :json => "hello world" }
			format.json { render :json => superheros }
		end

	end

	def create
		# if validate_hash(params)
			respond_to do |format|
				format.json do
					hash = {name: params[:name]}
					hash[:real_identity] = params[:real_identity]
					hash[:age] = params[:age]
					hash[:city_id] = params[:city_id]
					hash[:powers] = params[:powers]
					superhero = Superhero.create(hash)
					# hero = Superhero.create(hash)
					# hash = JSON.parse(request.body.read)
					# binding.pry
					# superhero = Superhero.create(hash[0])
					if superhero.valid?
						render :json => superhero
					else
						render :json => superhero.errors.messages.to_json
					end
				end
			end
		# else
			# render :json => "Bad input".to_json
		# end
	end

	def update
		respond_to do |format|
			format.json do
				hero = Superhero.find(params[:id])
				hash = {name: params[:name]}
				hash[:real_identity] = params[:real_identity]
				hash[:age] = params[:age]
				hash[:city_id] = params[:city_id]
				hash[:powers] = params[:powers]
				hero.update(hash)
				render :json => hero
			end
		end
	end
			


end