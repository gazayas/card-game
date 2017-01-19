require './game'

game = Game.new
game.start

p "プレイヤー１："
game.player1.hand.each do |card|
  p card.value.to_s + " : #{card.type}"
end
print "\n"

p "プレイヤー２："
game.player2.hand.each do |card|
  p card.value.to_s + " : #{card.type}"
end
print "\n"

p "デッキーの残りの枚数：" + game.deck.cards.size.to_s
