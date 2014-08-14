##Week2-Day03

- **Goal**: To continue exploring how to use templates to dynamically generate our html
- **Spec**:
  - Create a TCP server in Ruby
  - There should be a route to `/` that displays a list of all the students in our class
  - If you click on a students name, you should be shown Github information about that student
    - Use the provided data to fill in this information
      - Include login, created_at, html_url, public_repos and avatar image
  - You **must** use templates and `.gsub` to limit the amount of html pages that you have to create

- **Things to Consider**:
  - It is a really good idea to initially start with creating a template to view the Github information of just one student.
  - Once you have a good idea of how that is working, you can build the rest of the assignment around it
- **Data**:
  - [Student Github Hash](https://gist.github.com/jkonowitch/67d63351948f838b089d)
  - Follow the link and copy the entire hash into your Ruby file
- **Bonus**
  - Add stylesheets
  - Use RUBY to add your stylesheets to the `<head>` of your html. (ie, can you not type the `<link>` tag into every html file)
