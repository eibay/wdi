### House/Character Tracker

Create a web app that keeps track of which characters are in which houses.

1) Copy the `model.rb` into your GOT project and use it to create classes for House and Character.
  * House - name, age ; Character - name, image_url
  * Practice creating houses and characters on the command line.

2) Routes

  * `/` -> A welcome page with links to `/characters` and `/houses`
  * `/characters` -> a list of the characters with links to their `/charaters/:id` page
  * `/characters/:id` -> information about the character and what house they belong to.
  * `/characters/new` -> a form to create a new character
  * `/houses` -> a list of houses with links to the `/houses/:id` page for each one
  * `/houses/:id` -> A page with information about an individual house and a list of characters that belong to it.
