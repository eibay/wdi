class DogController < ApplicationController
  
layout false

  def index
  	render('hello')
  end

  def hello
  	render('index')
  end

  def other_hello
  	redirect_to(:controller => 'dog', :action => 'index')
  end


end
