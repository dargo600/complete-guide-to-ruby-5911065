require_relative 'dice'

class DiceTen < Dice

  def sides
    10
  end

  def display
    "{ #{value} }"
  end
end
