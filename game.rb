require './card'
require './deck'
require './person'

class Game

  attr_accessor :deck, :player1, :player2, :season
  
  def initialize
    @deck = Deck.new
    @player1 = Person.new
    @player2 = Person.new
    @board = [[], []] # player1とplayer2が実際にplayしたカード
    @season
    @discard_pile = Array.new

    @player1.shuffle @deck
  end
  
  def play
    4.times do
      @season = next_season
      p "季節は：#{@season}"
      
      @player1.draw_from deck
      @player2.draw_from deck
      
      1.upto 5 do
        p1s_card = @player1.play
        p2s_card = @player2.play
        @board[0] << p1s_card
        @board[1] << p2s_card
        winner = evaluate_cards p1s_card, p2s_card
        if winner.class != Person
          p "引き分けで次のメソッド行く"
        else
          if winner == @player1
            @board.each do |bd|
              bd.each do |b|
               @player1.cards_won << b
              end
            end
          elsif winner == @player2
            @board.each do |bd|
              bd.each do |b|
               @player2.cards_won << b
              end
            end
          end
          @board[0].clear
          @board[1].clear
        end
      end
    end   
  end
  
  def evaluate_cards card1, card2
    p card1.type + card1.value.to_s + "と" + card2.type + card2.value.to_s
    type_winner = compare_types card1, card2
    if type_winner
      return type_winner
    else
      value_winner = compare_values card1, card2
      if value_winner
        return value_winner
      else
        if @board[0][1] == nil
          return "未確定" # nil                
        else
          2.times do @discard_pile << @board[0].delete_at(0) end
          2.times do @discard_pile << @board[1].delete_at(0) end
          return "引き分けです" # nil
        end
      end
    end
  end

  def compare_types card1, card2
    if card1.type == @season && card2.type != @season
      @player1
    elsif card1.type != @season && card2.type == @season
      @player2
    else
      nil
    end
  end

  def compare_values card1, card2
    if card1.value > card2.value
      @player1
    elsif card1.value < card2.value
      @player2
    else
      nil
    end
  end

  def next_season
    case @season
    when nil
      @seasons = Seasons[:spring]
    when Seasons[:spring]
      @season = Seasons[:summer]
    when Seasons[:summer]
      @season = Seasons[:fall]
    when Seasons[:fall]
      @season = Seasons[:winter]
    end
  end
  
  def result
    if @player1.score > @player2.score
      p "プレイヤー１の勝ち"
    elsif @player1.score < @player2.score
      p "プレイヤー２の勝ち"
    else
      p "引き分け"
    end
  end

end
