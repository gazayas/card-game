class Person

  attr_accessor :hand, :score

  def initialize
    @hand = Array.new
    @cards_won = Array.new
  end
  
  def deal(deck, opponent)
    1.upto 5 do
      self.hand << deck.cards.delete_at(0)
      opponent.hand << deck.cards.delete_at(0)
    end
  end
  
  def draw
    #各季節の始めに
  end
  
  def play
  end
  
  def shuffle deck
    3.times do
      deck.cards = deck.cards.shuffle
    end
  end
  
end
