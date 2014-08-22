#Week3-Day05
---

##Friday Lab - Seattle Grace Hospital

- **Goal**: Create web and command line applications to keep track of patients at the Seattle Grace Hospital
- **Spec**:
    - All parts to this lab will use the **same** file to store patients data in JSON.
    - The data file will store patient's First name, Last Name, Date of Admittance, and Condition (e.g. Flu, Rabies)
    - **Tip**: Make a backup of this data file in case your code clobbers it

###Part 1

- **Objective**: Create a command line application to add one patient to the hospital

- **Spec**:
    - Your command line app should ask the user for a first name, last name, date of admittance, and Condition
    - The application should not loop, it should grab the user's input only once:
    - You should persist data to the one file holding all patients information

###Part 2

- This should be a separate program from Part 1, but should use the same file with the patients data.

- **Objective**: Create a command line application to search for patients by condition
- **Spec**:
    - Your application should ask the user for a single condition
    - **All** patients with that condition should be printed to the terminal, including their First Name, Last Name, and Date of Admittance

###Part 3
- This should be a separate application written in a different ruby file from Parts 1 and 2, but should use the same file with the patients data.

- **Objective**: Create a **server** to add and view patients

- **Spec**:
  - Create a root page that lists all patients, including their First Name, Last Name, and Condition.
  - Create a page to add a patient
  - Create a page to search for patients by condition, handling the case where there are multiple patients in the results
  - Create a page to search for patients by First Name only, handling the case where there are multiple patients in the results



###Bonus
1. Modify the server in Part 3 to enable the user to add a randomly generated patient. Generate a random patient by using the API at ```http://api.randomuser.me```. You can find more info [here](http://randomuser.me).
2. Change your data file and applications so that each patient has a doctor assigned to them.
  - All doctors should be actual characters from the Grey's Anatomy television show (**Hint**: use the greys.txt file that we gave you in Friday's morning exercise).
  - Feel free to choose how to implement this in your applications. Should users type in a doctor's name? Should you randomly assign a doctor for them?
3. Create the method ```find_by(key, value)``` to simplify your code that searches for patients by condition or name.
  - Example calls might look something like ```patients = find_by("condition", "flu")``` or ```patients = find_by("first", "John")```.
  - **Super Bonus**: Can you figure out how to put this method in its own file so that your applications in Part 2 and Part 3 can both use it?
