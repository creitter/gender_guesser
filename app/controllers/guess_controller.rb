class GuessController < ApplicationController
  include GuessHelper
  
  def index 
    @guess = Guess.new
  end
  
  def make_guess
    @guess = Guess.new(params[:guess])
    
    if @guess.valid?
      @guess.normalize_guess
      @result = make_a_guess(@guess)  
    end
    
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
