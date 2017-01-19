Seasons = {
  spring: "春",
  summer: "夏",
  fall: "秋",
  winter: "冬"
}

require './game'

game = Game.new
game.play

p "デッキーの残りの枚数：" + game.deck.cards.size.to_s
