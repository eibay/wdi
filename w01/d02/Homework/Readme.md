#Week1-Day2
---

##Part 1 - Trunk Space
- **Goal:** To add a new feature to our driverless car application.
- **Feature:** Our car has an average sized trunk. It can hold up to 6 items, but no more. Write an application that can keep track of what items are currently in the trunk and have it stop me from adding more items once I am up to 6.
- **Spec:**
  - Add items to the trunk
  - Be prevented from adding more than 6 items
  - Recieve a warning saying "Trunk is full" when a 7th item is attempted to be added
- **Things to consider:**
	- How will you represent the trunk in your code?
      - Use the below starter code for guidance
      - Note that the array of items has more than 6 items, so not all of them should be able to fit in the trunk array.
  - Think about how a loop can help you accoplish the spec

```ruby
trunk = []
items = ["Soccer Ball", "Suitcase", "Laptop", "Grocery Bag", "Gym Bag", "Jumper Cables", "Ice Scraper", "Spare Tire", "Shoes"]
```
---
##***Bonus*** - Fast Food

- **Goal**: Create an application that can predict how long it will take for an order at a fast food restaurant to be completed
- **Spec**:
  - Specify an order
  - See a total time of completion
- **Menu**:
```ruby
["Soda", "Fries", "Milkshake", "Chicken Tenders", "Hot Dog", "Hamburger", "Chicken Sandwich", "Double Cheeseburger", "Pizza"]
```
- This fast restaurant has a menu that is set up in a very specific way. Each item on the menu has a completion time of exactly one minute more than the previous item on the menu.
  - `Ex.` Soda takes 1 minute to prepare, thus Fries will take 2 minutes to prepare and a Milkshake will take 3 minutes to prepare.
- Assume that the restaurant employees can only cook one item a time.
- **Bonus**: Lets now assume that there is a 30 second delay between the completion of each item. Re-write the application to take this into account.
