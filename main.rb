Seasons = {
  spring: "春",
  summer: "夏",
  fall: "秋",
  winter: "冬"
}

require './game'

game = Game.new
game.play

p "プレイヤー１の枚数：" + game.player1.cards_won.size.to_s
p "プレイヤー２の枚数：" + game.player2.cards_won.size.to_s
p "枚数合計：" + (game.player1.cards_won.size + game.player2.cards_won.size).to_s
