require_relative 'dice'

class DiceTwenty < Dice

  def sides
    20
  end

  def display
    "*#{super}* #{handle_twenty}"
  end

  private
    def handle_twenty
      case value
      when 1
        " - Certain Falure"
      when 20
        " - Critical Success"
      else
        ""
      end
    end
end
