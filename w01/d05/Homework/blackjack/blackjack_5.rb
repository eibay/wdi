----
###Part 5
- Goal: Create two sided blackjack over a network connection!!!!!
  - Player 1 will be the person running the program (use puts and gets to I/O with them)
  - Player 2 will connect through netcat (use client.puts and client.gets to I/O with them)
      - Note that you can intersperse puts, gets, client.puts, and client.gets with no problem
      - Also note that both gets and Client.gets will pause the program as it waits for input
  - Deal two cards to player 1 and two cards to player 2 (cards chosen at random)
  - Player 1 and 2 alternate turns, your program can choose who goes first.
    - If they type "Hit me" then draw another card
      - If they have gone bust tell both players, announce the winner for that hand and then deal another round
      - If they have not gone bust, then move to the other player, unless the other player has chosen to stay, in which the round is done.
    - If they choose "Stay" then output the Blackjack value of their hand.
  - Now it is the other player's turn
    - If they have stayed, you should announce the winner and deal another round.
- Keep playing until you are out of cards. When a new round start output the amount of wins that each player has


---

###Super bonus extroardinare!!
  - Can you change blackjack to handle more than 2 players? Hopefully you have enough computers!
