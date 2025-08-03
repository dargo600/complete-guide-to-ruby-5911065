require_relative 'dice'

class DiceFour < Dice

  def sides
    4
  end

  def display
    "/ #{value} \\"
  end
end
