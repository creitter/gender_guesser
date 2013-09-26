class GuessController < ApplicationController
  include GuessHelper
  def index 
    @guess = Guess.new
  end
  
  def make_guess 
    @result = make_a_guess(params[:height], params[:weight])
    render :index
  end
  
end
