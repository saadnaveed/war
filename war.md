## Introduction

It is time to build a larger Ruby application, wherein two players can play the classic card game of "War". Note that if you have played this game in the past, the version that you will be making for this challenge will have different rules!

To begin, let's go over the rules. We'll be playing a simplified version of the original game to start:

* There are two opponents; the computer and the player
* There are only 12 cards in the deck (only one suit, and the "ace" card is excluded to keep the number of cards even)
* Each card has a value, determined by its rank e.g. 4, 9, Queen(12), King(13)
* The suits of the cards are ignored (e.g. Diamonds '♦').
* The 12 cards need to be shuffled and then split amongst both players. Players cannot see their cards.
* The game begins with both players dealing the top card from their deck. The value of the cards is then compared, and whoever has the higher value card takes both cards and adds them to the bottom of their deck. The game continues with both players turning over their next top cards until the game is over or there is a tie between the card values.
* For our simple version of the game, there is no tie.
* The object of the game is to win all of the cards.
* The first player to run out of cards loses, and the other player wins.

You've probably noticed that there isn't really any strategy in this game; winning or losing is purely based on chance. However, building an application to play this the game is a great exercise in building an object oriented Ruby application.

Additionally, you will complete this simple version of the game "War" (that we have already outlined), so that you can move on to a more complex version later.

## Learning Goals

* Practice building out Ruby classes and defining methods.
* Write a program that utilizes multiple classes in separate files.
* Practice **object composition** (objects using objects).

## Instructions

Write a program where the user can play a game of **War**.

In order to determine how best to organize and write our code, let's first determine what objects we will need in order to play the game, and how exactly our player will begin the game.

Define and use the following classes to organize your code:

* `Card` to represent an individual playing card. This class should contain the suit and the rank and provide methods for determining what type of card it is (e.g. its value, particularly compared to another card). Write the code to implement this class in `lib/card.rb`.
* `Deck` to represent a collection of 52 cards. When dealing a hand this class can be used to supply the `Card` objects. Write the code to implement this class in `lib/deck.rb`.
* `Hand` to represent the player's and computer's half of the deck. This class is where we will be dealing our cards from each turn. It will also be where we place cards that we have won, and it will help determine whether or not a player has lost the game. Write the code to implement this class in `lib/hand.rb`.
* `Round` to represent a round of the game, when both the player and computer draw a card. The required instance methods have been provided for you.
* `War` to organize the logic for the game. The required instance methods have been provided for you. Take a moment to familiarize yourself with these methods, so that you can understand how the game logic works.
* `game.rb` will be where we implement and instantiate the classes that we have defined. This file will essentially be the entry point to our application, and it will help us determine the state of the game.

## Managing Problem Complexity with User Stories

We can simplify the complexity of our Ruby application by describing the gameplay in the form of **user stories**. The goal of a well-written user story is to describe how a user will interact with the software.

**Focus on implementing one user story at a time.** This is how professional software developers manage the complexity of large software projects.

The program should satisfy the following user stories:

#### Deal Initial hand

```no-highlight
As a player
I want to initially be dealt out 6 cards
So that we can begin the game
```

Acceptance Criteria:

* Cards are dealt from a shuffled deck of 12 cards.
* Output `Player was dealt __ cards` for each card the player receives. The number of cards in the output should be based on the total number of card objects in the player's hand.
* Output `Computer was dealt __ cards` for each card the computer receives. The number of cards in the output should be based on the total number of card objects in the computer's hand.

Note, if implemented correctly, the number of cards in a hand should always be 6 upon starting the game.

#### Prompt for the User for Input

```no-highlight
As a player
I want to be prompted to start or quit the game
So that I know when I have to act
```

Acceptance Criteria:

* Prompt the player to start the game or quit.
* Output `Ready to start? (y/n):` and read the user input on the same line.
* If the user inputs "y", the game should begin.
* If the user inputs "n", the output `"Goodbye"` should appear, and the game should end.
* Notify the user when the input is invalid (neither "y" or "n") and re-prompt.
* Allow uppercase or lowercase characters as user input.

#### Player Sees the Results of the Round

```no-highlight
As a player
I want to see the results of a round
So that I can can keep track of my victories
```

Acceptance Criteria:

* Display both the player's card value and the computer's card value every time a player deals.
* Output `Players card value: VALUE` on a separate line.
* Output `Computers card value: VALUE` on a separate line.
* If the player wins the round, I should see the output `You win the round! You now have <NUMBER_OF_CARDS> cards` and then add the cards that were dealt to their hand of cards.
* If the computer wins the round, I should see the output `Computer wins the round! You now have <NUMBER_OF_CARDS cards` and then add the cards that were dealt to the computer's hand of cards.

#### Winning or Losing

```no-highlight
As a player
I want to be told if I won or lost
So that I can see if I am victorious
```

Acceptance Criteria:

* If the computer runs out of cards, I should see the output `Computer is out of cards. You win!` and the game should end.
* If the player runs out of cards, I should see the output `Player is out of cards. You lose!` and the game should end.


## Sample Output

```no-highlight
$ ./war.rb
Let's play WAR!
Player was dealt 6 cards. Computer was dealt 6 cards.

Ready to start? (y/n): y

You have 6 cards in your hand.
Players card value: 4
Computers card value: 11
Computer wins the round!

You have 5 cards in your hand.
Players card value: 8
Computers card value: 7
You win the round!

...

Computer is out of cards, you win!

```

```no-highlight
$ ./war.rb
Let's play WAR!
Player was dealt 6 cards. Computer was dealt 6 cards.

Ready to start? (y/n): n

Goodbye!
```

## Setup

First, be sure to examine the files that have been provided for you. This may be one of the first applications that you are creating that contain multiple Ruby files.

#### Game File
First look at the `game.rb` file in your root directory. This is the file that you will run in order to start the game e.g. `ruby game.rb` in your command line. It's very common that there is one file in a Ruby application that runs the whole program, while any additional classes that are used are stored in the `lib` folder.

At the top of the file, you'll notice the first two lines commented out. Let's comment them in now.

The first gives us access to `pry` a library that we have installed upon running `bundle`. It's one of the most useful tools you will use during your learning, and `pry` is fantastic for debugging your code.

The second line allows us access to the code in another file `lib/war.rb`. We are requiring it here because we invoke it with `War.new` further along in the file. The `War` class in turn invokes other classes, but since we don't explicitly invoke them in this file, we don't need to add other `require_relative` lines.

The rest of the supplied code creates an instance of the `War` class, and begins the game.

We've already supplied much of the "runner" code for you. Note: We encourage you to satisfy the core user stories outlined above before making any changes to the file.

#### War File
Let's examine one of the files in our `lib` folder. In our library folder, we create all of the models that we will need in order to run our application. There shouldn't be any code outside of the scope of the classes except for our `require` statements.

In `lib/war.rb`, our `War` class comes with some prebuilt methods, and some methods that you will need to finish for yourselves!

The `#initialize` method will create a new `Deck` object for us, which we will need to create, but eventually we should have a `Deck` object containing 12 `Card` objects. you may also define any other methods you deem necessary. There are also two instance variables that will need to store `Hand` objects. These `Hand` objects will in turn hold `Card` objects. You will have to brainstorm how you can use your other classes to get your game of War started correctly.

As you can see, objects will need to be shared between one another to get the application working. Because objects have state via instance variables, those variables may contain any number of *other* objects stored inside them. In this way, our objects begin to form implicit relationships with one another. A `War` object has one `Deck` and two `Hand`s. A `Deck` is comprised of many `Card`s by storing them in an array, and those `Hand` objects mentioned will be passed some of `Card` objects from `Deck` object to hold in an array of its own.

The `#play_round` method has been started for you. Here, we abstract a "round" of the game, wherein the top cards of both opponents hands are compared in order to determine who wins the round. You will have to finish building this method in order to properly handle the logic of the game.

The rest of the methods will give you hints as to how you can write them. These hints are pseudocode, and we encourage you to follow a similar pattern of planning out your methods when you write code as well.

#### The Rest of the Game
Continue to reflect on the comments provided in each of the other files. We have provided many of the methods that you will likely need in order to develop your first War application, but you decide to create methods of your own. **Be sure to brainstorm how you wish to use each class such that it contributes to the logic of the game**.

Discussing strategy with others is strongly encouraged!

Now go out and get coding!


### Optional Work
**Only begin working on these features once you have finished the core user stories outlined above.**

Your game works! But it doesn't yet play like the game you may have played in the past. Add the following features to your app in order to increase the complexity of the game.

* Add a shuffle mechanic for increased randomness! Have all of the cards in the players hands be randomized between rounds.
* Allow for four suits ('♦', '♣', '♦', '♥') and ace cards, in order to play with a 52 card deck! **Note:** until you build out a feature that helps resolve ties, this could cause your application to run for a long time, and may require you to run `Control + C` to quit the program.
* Allow for a "tie" condition. When two players play a card of equal value (e.g. '3♦' and '3♥'), output "Tie!", move the cards to the bottom of the respective decks, and deal again.
* Upgrade your "tie" condition to allow for the classic "WAR" condition. See wikipedia's "Gameplay" section for further details: [War Wikpedia Article](https://en.wikipedia.org/wiki/War_(card_game))
* Customize your game! Allow for user inputs, or special modes of play. See the "Versions" section of the wikipedia article for more details: [War Wikpedia Article](https://en.wikipedia.org/wiki/War_(card_game))
