class GuessController < ApplicationController
  include GuessHelper
  
  def index 
    @guess = Guess.new
  end
  
  def make_guess
    height = params[:height].to_i
    weight = params[:weight].to_i  
    
    @result = make_a_guess(height, weight)

    respond_to do |format|
      format.js { 
        render :template => 'guess/update.js.erb'
      }
      format.html {
        render :index
      } 
    end    
  end
  
end
