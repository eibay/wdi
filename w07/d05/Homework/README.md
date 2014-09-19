### Hangman

**Build your components**

With a partner, iteratively develop code to run a hangman game in the console.

As a reminder of how hangman is played...

  * The game starts with a secret word.
  * The player knows how many letters the word has.
  * They guess letter by letter.
  * They see both the incorrect letters they guessed as well as the secret word filled in with the correctly guessed letters.
  * They get 8 incorrect guesses until they lose.
  * They win when they've completely filled in the secret word.

Follow the model of this morning: 
  
  Start with basics. What is the smallest, simplest piece of functionality I can build? What does this component take as input? Where can I direct it's output to know if it is working (ie the console)?

For example - you decide that your first component is something which takes a letter and a word as an argument and determines if that letter is in the word...

```javascript
letterInWord('e', 'cathode');
// true
```

Then let's say the next piece is, given letters which have been guessed and a new letter, determine if it's been guessed or not.

```javascript
guessed('e', ['e', 'i', 'k'])
// true

guessed('f', ['e', 'i', 'k'])
// false
```

You should **not** be thinking about the DOM or any user interface elements to start. Do not move on from this stage until you are able to play a full game of hangman in the browser console.

<span style="color: grey;">*commit and push*</span>

**UI**

Now that you've got the game logic working, please look at the index.html and css file. It represents the UI for the game. Your task is now to connect the inputs of the DOM (ie keypresses, clicks, etc.) to the game logic to make the game playable by a human.

You should follow the same process as above. Start small and connect things one at a time.

<span style="color: grey;">*commit and push*</span>

**Data**

1. We've been working with secret words in the browser. Now, let's design a server with a route where we can retrieve a new secret word for each new game.
2. Let's store the total number of games won and lost on the server and be able to view the totals when the game page is refreshed.

<span style="color: grey;">*commit and push*</span>