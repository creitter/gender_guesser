class GuessController < ApplicationController
  include GuessHelper
  
  def index 
    @guess = Guess.new
  end
  
  def make_guess
    height = params[:height].to_i
    weight = params[:weight].to_i  
    
    @result = make_a_guess(height, weight)
    render :index
  end
  
end
