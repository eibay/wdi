#Friday Lab

---

##MOAR Rails.

**Goal**:
- Create a 2 model CRUD application in Rails.

**Spec**:
- *Models*:
  - Artist
    - id
    - name
    - genre
    - number_of_albums
  - Song:
    - id
    - name
    - artist_id
- *Routes*:
  - Be sure to have all of the appropriate routes that a CRUD application will require
  - Bonus: Use Rails' [nested resources](http://guides.rubyonrails.org/routing.html#nested-resources) feature, but only do so if you understand what it is doing. Otherwise, it will just confuse you more.
- *Views*
  - Be sure to have all of the appropriate views that a CRUD application will require
  - Bonus: Use Rails' [view partials](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials) to DRY up your views

**Bonus**:
- Use Rails [Form Helpers](http://guides.rubyonrails.org/form_helpers.html) instead of standard HTML forms
- Use the [MusicBrainz](https://musicbrainz.org/) API to get Artist information.
  - You can choose whether to use the MusicBrainz gem or HTTParty
- Add a 3rd model for Albums.
  - How does this relate to songs and artists?
