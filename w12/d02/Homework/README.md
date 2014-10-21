## Lab

---

**Goal:**
  - Create a Single Page (or close to it) Application with Auth

**Spec:**
  - Create an Auth scheme similar to the one used in class
    - Remember that this will require a `User` model
  - Once the user is logged in, we want to minimize page refreshes using AJAX
    - You really should *NOT* need more than one erb/html file (outside of auth) to accomplish this lab
  - The user should be able to add and delete songs to the database and consequently have them show on the page
    - Don't worry about updating.
  - Once a song has been added to the page, there should be a button next to it for the user to 'like' the song
  - Clicking this button will trigger an AJAX to add the 'like' to the database
    - *HINT*: Implementing a 'like' feature will require the use of a join table
