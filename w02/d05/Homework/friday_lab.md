#Week2-Day05
---
##Friday Lab - MusicBrainz
- **Goal**: Create a program that allows for artist searches and through the browser. Data will be pulled from the MusicBrainz API.

###Part 1
- Get comfortable with making the API call ***before*** you start building the server
- Use Pry or a separate Ruby file to make the API Calls and practice manipulating the results
- Make the API calls using HTTParty
- Use this route to get the `search results`:
  - `http://musicbrainz.org/ws/2/artist/?query=artist:[***ARTIST_NAME***]&fmt=json`
  - [Sample Call](http://musicbrainz.org/ws/2/artist/?query=artist:prince&fmt=json)
  - **Objective**:
    - Navigate the returned hash and recall the array of artists
    - Iterate over the array and `puts` the name of each artist
- Use this route to get info on a `specific artist`
  - `http://musicbrainz.org/ws/2/artist/[***ARTIST_ID_FROM_MUSICBRAINZ***]?inc=aliases&fmt=json`
  - The ARTIST_ID_FROM_MUSICBRAINZ must be the ID that MusicBrainz uses to identify an artist. You can find this by first using the search route and looking in that hash for the ID of the artist you are interested in
  - [Sample Call](http://musicbrainz.org/ws/2/artist/5b11f4ce-a62d-471e-81fc-a69a8278c7da?inc=aliases&fmt=json)
  - **Objective**:
    - Navigate the hash and `puts` each of the following information bits about the artist - origin country,  artist/band name, general info about the artist.
      - These fields will not be named as they are listed here, examine the hash to see where the relevant pieces of information are and how they are nested.


###Part 2
- Do ***NOT*** move on to Part 2 until you have completed the objectives from Part 1
- **Spec**:
    - You should be able to enter an artists name on a page using a form
    - A list of the artists' name that are returned in the search results should then be displayed
    - You should be using HTTParty to make the API request and templates to display the returned information

###Part 3
- Do ***NOT*** move on to Part 3 until you have completed the objectives from Part 1
- **Spec**:
  - After seeing the search results displayed from Part 2, I should be able to click on any of the artists' names
  - Upon clicking on a specific artist's name, you should be taken to a page that displays more details information about that specific artist.

###Bonus
- Style the pages!
- Can you figure out a way to include images of the artist on their individual pages?
