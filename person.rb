class Person

  attr_accessor :hand, :cards_won, :score

  def initialize
    @hand = Array.new
    @cards_won = Array.new
    @score = 0
  end

  def shuffle deck
    3.times do
      deck.cards = deck.cards.shuffle
    end
  end

  def draw_from deck
    1.upto 5 do
      @hand << deck.cards.delete_at(0)
    end
  end
  
  def play
    # ここで左右のキーで好きなカードを選ぶ
  end

  def count_score
    @cards_won.each do |cw|
      @score += cw.value
    end
  end
  
end
