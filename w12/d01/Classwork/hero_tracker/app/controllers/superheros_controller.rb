class SuperherosController < ApplicationController

  def index
    superheros = Superhero.all
    respond_to do |format|
      #based on format-respond this was
      # format.html{ render  :json => "hello world"}
      #defaults to html so only if need something else like json do you need to write it
      # format.html{ render "hello world"}
      #if has a view page assos with it
      format.json { render :json => superheros }
      #what the client will get
      format.html { render text: "hey" }
      #turns it into json, when superheros.json
      #only rails!!!!!!!
    end


  end


    def create
    superhero = Superhero.new(name: params["name"], age: params["age"], real_identity: params["real_identity"], powers: params["powers"], city_id: params["city_id"])

    respond_to do |format|
      format.json do
        if superhero.valid?
          superhero.save
          render :json => superhero
        else
          render :json => superhero.errors.messages.to_json
          #the rails error messages
          # render :json => "Bad input!".to_json
        end
      end
    end
  end

# def create
#   respond_to do |format|
#   # if params["name"] == nil  || params["age"] == nil || params["real_identity"] == nil || params["powers"] == nil || params["city_id"] == nil || params["name"] == ""  || params["age"] == "" || params["real_identity"] == "" || params["powers"] == "" || params["city_id"] == ""
#   #   format.json { render json: {:msg => 'Bad Input'} }
    
#   # else
#   if valid == true
#      superhero = Superhero.create(name: params["name"], age: params["age"], real_identity: params["real_identity"], powers: params["powers"], city_id: params["city_id"])
#     format.json {render :json => superhero}
#   else
#       render :json => "Bad input!".to_json
    


#     # HTTParty.post("http://localhost:3000/superheros.json", :body =>{ "name"=> "Tejal", "age"=> 27, "real_identity"=> "Patel", "powers" =>"Awesome", "city_id"=> 1})
#   #index is to show all superheros
#   #can you have a route with two purposes
#   #send json if making ajax calls to here
#   #and to render out html
#   #in this one just doing API
# end
# end
 
# end



  def update
    
    superhero = Superhero.find(params[:id])
    superhero.name = params["name"]
    superhero.age = params["age"]
    superhero.real_identity = params["real_identity"]
    superhero.powers = params["powers"]
    superhero.city_id = params["city_id"]

    respond_to do |format|
      format.json do
        if superhero.valid?
          superhero.save
          render :json => superhero
        else
          render :json => superhero.errors.messages.to_json
        end
      end
    end
# HTTParty.put("http://localhost:3000/superheros/1.json", :body =>{ "name"=> "Test", "age"=> 27, "real_identity"=> "Patel", "powers" =>"Awesome", "city_id"=> 1})

end
end
