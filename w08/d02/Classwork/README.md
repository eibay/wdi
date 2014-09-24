### Tshirt.ly

**Goal**

We are going to build a prototype of a tshirt store using ruby and bootstrap.

**Features**

  1. A user can see a list of t-shirts.
  * A user can "buy" a t-shirt.
    * No payment information is entered.
    * The user selects the quantity they want to purchase, and enters their email address.
    * The user is presented with a confirmation page.
  * A user can go to `/admin` and see an admin panel.
    * They can add t-shirts and remove t-shirts; each t-shirt for sale has a quantity avaiable, a price, and an image url. (all t-shirts are one-size-fits-all)
    * They can also see a list of all the pending orders created by their customers.
    * They can "fulfill" a pending order, which removes the order and subtracts the quantity of the order from the quantity available for that t-shirt.
    * They can see a list of "sold out" and "oversold" t-shirts - ones with available quantities of zero or negative numbers.

**Process**

ABBID ("Always Be Breaking It Down")

*Wireframes*

  * Draw wireframes detailing the flow of all the user actions
  * Where will stuff be? How many pages are there? Where and when do certain actions take place?

*Data Model*

  * what are the entities for this application?
  * create an ERD and migrate your database to reflect this

*Console = friend*

  * Setup your application folder and make sure you can CRUD your models in pry

*One step at a time...*

  * Build one feature at a time and don't move on to the next one until you are finished with the last.

*Fancification*
  
  * Check out [Bootstrap's documentation](http://www.getbootstrap.com) and fancify your application with any styling components that seem cool to you. Have fun!

