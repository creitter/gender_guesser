class Guess
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  # validates :height, :weight, presence: true
  # validates :height, :weight, numericality: true
  
  attr_accessor :height, :weight
  
  def persisted?
    false
  end
  
end
