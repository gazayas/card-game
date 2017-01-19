Seasons = {
  spring: "春",
  summer: "夏",
  fall: "秋",
  winter: "冬"
}

class Deck

  attr_accessor :cards, :discard_pile
  
  def initialize
    @cards = Array.new
    @discard_pile = Array.new
    
    Seasons.each do |s|
      1.upto 10 do |x|
        card = Card.new(s[1], x)
        @cards << card
      end
    end
  end
  
end
