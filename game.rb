require './card'
require './deck'
require './person'

class Game

attr_accessor :deck, :player1, :player2, :round, :season
  
  def initialize
    @deck = Deck.new
    @player1 = Person.new
    @player2 = Person.new
    @round = 1
    @season = Seasons[:spring]
  end
  
  def start
    @player1.shuffle @deck
    @player1.deal deck, @player2
  end
  
  def turn
  end
  
end
