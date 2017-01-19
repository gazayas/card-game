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
    # 誰が先に行くか決める。コインか何かで
    # 簡単に開発できるように、player1が勝手に最初に行く
  end
  
  def play
    4.times do
      @season = next_season
      @player1.draw_from deck
      @player2.draw_from deck
      
      p "季節は：#{@season}"

      5.times do
        draw = play_cards
        if draw
          second_time = true # 最後の季節でカードが全部なくなったら、ゲームを終わらせてください
          play_cards(second_time)
        end
        # winnerがカードを全部もらう
        @board[0] = []
        @board[1] = []
      end
    end
  end

  def play_cards(second_time=false)
    #until @player1.hand.count == 0 && @player2.hand.count == 0
    
      # 五回目で引き分けになったら、次の@board[0]や@board[1]がnilになってしまう。
      # ここは対応が必要
      # hand.empty?だったら、deckにカードが残ってたら、次のturnに行きたい
      # deckはもうなくなったら、discard_pileへ移っで、ゲームが終わる
      # 二回カードを出して二回とも引き分けに終わったら、そのカード全部をdiscard_pileにする
      if @player1.hand.empty?
        p "引き分けに終わりました"
        return false
      end
      @board[0] << @player1.hand.delete_at(0) # 実際に@player1.play
      @board[1] << @player2.hand.delete_at(0) # 実際に@player2.play

      if !second_time
        p "card1 is " + @board[0][0].type + ":" + @board[0][0].value.to_s
        p "card2 is " + @board[1][0].type + ":" + @board[1][0].value.to_s
      
        type_winner = compare_types @board[0][0], @board[1][0]
        value_winner = compare_values @board[0][0], @board[1][0]

      if type_winner.class != Array
        winner = type_winner
      else
        if value_winner.class != Array
          winner = value_winner
        else
          return true
        end
      end

    else
      p "card1 is " + @board[0][1].type + ":" + @board[0][1].value.to_s
      p "card2 is " + @board[1][1].type + ":" + @board[1][1].value.to_s
      
      type_winner = compare_types @board[0][1], @board[1][1]
      value_winner = compare_values @board[0][1], @board[1][1]

      if type_winner.class != Array
        winner = type_winner
      else
        if value_winner.class != Array
          winner = value_winner
        else
          return "drawに終わりました"
        end
      end

    end

    if winner.class != Array
      p "the winner is " + winner.type + ":" + winner.value.to_s
      false
    else
      # p winner.type + ":" + winner.value.to_s
      true
    end
    print "\n"
  end

  def compare_types card1, card2
    if card1.type == @season && card2.type != @season
      card1
    elsif card1.type != @season && card2.type == @season
      card2
    else
      [card1, card2]
    end
  end

  def compare_values card1, card2
    if card1.value > card2.value
      card1
    elsif card1.value < card2.value
      card2
    else
      [card1, card2]
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
