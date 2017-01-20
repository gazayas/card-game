require 'io/console'
require './game'

Seasons = {
  spring: "春",
  summer: "夏",
  fall: "秋",
  winter: "冬"
}

game = Game.new
game.play
game.result
