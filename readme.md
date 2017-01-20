#Card Game

#起動
`$ ruby main.rb`

#ルール
すべての季節に付き、１０枚があります（合計で４０枚）。
ゲームは４ラウンド（季節）で行われます。
季節の始めに、プレイヤーは一人ずつ５枚をもらいます。
その中で、１枚を選び、テーブル上に出す。
数字の最も大きいカードの方が勝ちます。
しかし、カードの季節はゲームの現在の季節と一致していれば、数字が低くても、勝ちます。
勝ったら、その２枚をもらいます。
手札の５枚がなくなったら、次の季節が始まり、またプレイヤーたちに５枚のカードが配られます。

引き分けとなった場合、もう一度カードを出します。
そちらの方を勝った人は、４枚全部をもらいます。
また引き分けとなってしまえば、誰もカードをもらわずに４枚全部が捨て場へ捨てられます。

季節の最後のプレイが引き分けになった場合、次の季節で解決します。
山札にカードが残っていない場合は、ゲームは終了となります。

お楽しみください！

#Start up
`$ ruby main.rb`

#Rules
The object of the game is to get the most cards.
<strong>春 = Spring</strong>
<strong>夏 = Summer</strong>
<strong>秋 = Fall</strong>
<strong>冬 = Winter</strong>

There are 10 cards for each season, resulting in 40 cards total.
The game is played in four rounds (seasons).
At the beginning of each season, each player is dealt 5 cards.
You can choose any card from your hand on the table.
Whoever puts down the card with the biggest number wins,
but if it is spring and you put down a spring card with a value lower than your opponents' card,
you take the cards because seasons take precedence over numbers.
Once all 5 cards are gone, the next season comes, and each player is dealt 5 cards again.

In the case of a tie, place down another card with your opponent.
Whoever wins that round gets all four cards.
If it results in a tie again, all 4 cards are discarded.

If the last card of the season played results in a tie,
the tie breaker will resume in the next season.
If the last hand of the game played is a tie,
those 2 cards are placed in the discard pile.

Enjoy!
