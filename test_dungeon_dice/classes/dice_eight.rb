require_relative 'dice'

class DiceEight < Dice

  def sides
    8
  end

  def display
    "| #{value} |"
  end
end
