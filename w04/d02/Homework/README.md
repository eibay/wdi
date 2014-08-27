### Space Shuttles and Astronauts

Goal: Create a web application that keeps track of astronauts and the shuttles they are on.

1) Setup two models:

  * Shuttles '(name, origin_country, destination)'
  * Astronaut (name, rank)

2) Be able to associate astronauts and shuttles on the command line in `pry`.
  * Which "model" will have the `foreign_key`? How will you "encode" these relationships?

3) Create a web application that allows us to create and review shuttles and astronauts.

**Features**:
  * Create new shuttles.
  * Create new astronauts (and associate them with a shuttle).
  * View all astronauts, with links to an astronaut's individual page
    * Be sure to have the links handled using the ID
  * See an individual astronaut - should show all of their information, including what shuttle they are on.
  * View all shuttles, with links to individual shuttle pages
    * Be sure to have the links handled using the ID
  * See an individual shuttle - shows all of it's information, including what astronauts are aboard.

  
