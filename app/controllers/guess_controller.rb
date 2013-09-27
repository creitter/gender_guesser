class GuessController < ApplicationController
  include GuessHelper
  
  before_filter :normalize_params, only: :make_guess
  
  def index 
    @guess = Guess.new
  end
  
  def make_guess
    
    @result = make_a_guess(@height, @weight)

    respond_to do |format|
      format.js { 
        render :template => 'guess/update.js.erb'
      }
      format.html {
        render :index
      } 
    end    
  end
  
  def normalize_params
    @height = params[:height].to_f
    @weight = params[:weight].to_f
    
    # determine the height values used.
    if @height < 40 # I would presume it's safe to say a value of < 40  is probably in feet and inches
      @height = (@height.to_i * 12) + (@height % 1)
    end
  end
  
end
