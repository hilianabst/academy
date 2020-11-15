class HomeController < ApplicationController
  def index
    @trainings = Training.all
    
  end
end
