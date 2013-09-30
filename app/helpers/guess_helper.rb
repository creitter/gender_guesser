# Guess the gender of the user based on some generalization from http://www.healthchecksystems.com/heightweightchart.htm

module GuessHelper
  
  MIN_HEIGHT_FOR_MALE = 62 # 5 feet 2 inches = 62 Inches
  MAX_HEIGHT_FOR_FEMALE = 72 # 6 feet = 72 inches
    
  FEMALE_RANGES = {62 => (108..143), 63 => (111..147), 64 => (114..151), 65 => (117..155), 66 => (120..159), 67 => (123..163), 68 => (126..167), 69 => (129..170), 70 => (132..173), 71 => (135..176), 72 => (138..179)}
  MALE_RANGES = {62 => (128..150), 63 => (130..153), 64 => (132..156), 65 => (134..160), 66 => (136..164), 67 => (138..168), 68 => (140..172), 69 => (142..176), 70 => (144..180), 71 => (146..184), 72 => (149..188)}

  def make_a_guess(guess)

    could_be_female = FEMALE_RANGES[guess.height].present? && FEMALE_RANGES[guess.height].include?(guess.weight)
    could_be_male = MALE_RANGES[guess.height].present? && MALE_RANGES[guess.height].include?(guess.weight)

    if guess.height < MIN_HEIGHT_FOR_MALE || (could_be_female && !could_be_male)
      return :female
    elsif guess.height > MAX_HEIGHT_FOR_FEMALE || (could_be_male && !could_be_female)
      return :male
    else
      :do_not_know
    end
  end
  
end
