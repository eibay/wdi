#Week01-Day05: Friday Afternoon Lab
___

## Blackjack

###Part 1
  - Create an array with all the cards in a deck (2-10, J, Q, K A)
  - **Don't** explicitly just write out an array with 52 cards
    - You can write out a smaller array and then generate the rest
    - Output the array of cards
    
------

###Part 2
- Goal: To create a program that chooses two cards from the deck *at random* and outputs its value in blackjack.
- To calculate the value of a hand of cards:
  - 2-10 have the value of their number
  - All face cards have the value of 10
  - Ace is 1

-----

###Part 3
- Goal: To create a program that chooses 3 cards *at random*,
- Have it output the cards and their blackjack value or
  - Also include whether that value is "bust".
- Loop this program until there are no cards left in the deck.


-----
###Part 4

- Goal: Create one sided blackjack
  - A user is given two cards at random
  - They can type "Hit me" or "Stay"
  - If they type "Hit me" then draw another card, if they have gone bust tell them. Then draw another hand, which will once again give them the options "Hit Me" or "Stay".
  - If they choose "Stay" then output the Blackjack value of their hand. Then draw another hand, , which will once again give them the options "Hit Me" or "Stay".
- The game should end when you run out of cards

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
