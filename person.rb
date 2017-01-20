class Person

  attr_accessor :hand, :cards_won, :score

  def initialize
    @hand = Array.new
    @cards_won = Array.new
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
    position = 0
    arrows = {A: "↑", B: "↓", C: "→", D: "←"}

    while (key = STDIN.getch) != "\C-c"
      if key == "\e"
        second_key = STDIN.getch
        if second_key == "["
            key = STDIN.getch
            key = arrows[key.intern] || "esc: [#{key}"
        else
          key = "esc: #{second_key}"
        end
      end

      case key
      when "→"
        position += 1
        if position > (@hand.size - 1)
          position -= 1
        else
          $stdout.write "\e[5C"
        end
      when "←"
        position -= 1
        if position < 0
          position += 1
        else
          $stdout.write "\e[5D"
        end
      when "\r"
        $stdout.write "\e[#{5 * (position + 1)}D"
        return @hand.delete_at(position)
      end
    end
  end

  def cpu_play
    @hand.delete_at(0)
  end
  
end
