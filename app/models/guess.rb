class Guess
  extend ActiveModel::Naming
  include ActiveModel::Validations

  validates :height, :weight, presence: true
  validates :height, :weight, numericality: true
 
  attr_accessor :height, :weight

  def initialize(options={}) 
    @height = options[:height] if options.has_key?(:height)
    @weight = options[:weight] if options.has_key?(:weight)
  end
  
  def normalize_guess

    @weight = @weight.to_f

    # Treat height as a string first as I get odd mod values. For example 5.8 provides a mod of .7999999
    height_split = @height.split('.')
    @height = height_split.first.to_i
    
    # determine the height values used.
    if @height < 40 # I would presume it's safe to say a value of < 40  is probably in feet and inches
      @height = (@height.to_i * 12) + (height_split.last.to_i)
    end
  end
end
