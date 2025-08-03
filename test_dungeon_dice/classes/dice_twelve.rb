require_relative 'dice'

class DiceTwelve < Dice

  def sides
    12
  end

  def display
    "< #{value} >"
  end

end
