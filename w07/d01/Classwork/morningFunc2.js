	var boyMusician = [
  	{id: 1, name: "Jimmy Heyes", instrument: "guitar", band: "Juicy", email: "jheyes@gmail.com"},
  	{id: 2, name: "Jane Smith", instrument: "keyboard", band: "Juicy", email: "jsmith@gmail.com"},
  	{id: 3, name: "Jimmy Page", instrument: "guitar", band: "Led Zeppelin", email: "jpage@gmail.com"},
  	{id: 4, name: "Robert Plant", instrument: "vocals", band: "Led Zeppelin", email: "rplant@gmail.com"},
  	{id: 5, name: "John Paul Jones", instrument: "keyboard", band: "Led Zeppelin", email: "jjones@gmail.com"},
  	{id: 6, name: "John Bonham", instrument: "drums", band: "Led Zeppelin", email: "jbonham@gmail.com"},
  	{id: 7, name: "Mick Jagger", instrument: "vocals, harmonica", band: "The Rolling Stones", email: "mjagger@gmail.com"},
  	{id: 8, name: "Keith Richards", instrument: "guitar", band: "The Rolling Stones", email: "krichards@gmail.com"},
  	{id: 9, name: "Billy Wyman", instrument: "bass", band: "The Rolling Stones", email: "bwyman@gmail.com"},
  	{id: 10, name: "Ronnie Wood", instrument: "guitar", band: "The Rolling Stones", email: "rwood@gmail.com"},
  	{id: 11, name: "Charlie Watts", instrument: "drums", band: "The Rolling Stones", email: "cwatts@gmail.com"}
	];

  function createMusician() {
    var bands = ["Nirvana", "Soundgarden", "Crazy Horse", "Modest Mouse", "Ramones"]
    var names = ["Carl Perkins", "Ryan Adams", "Neil Young", "Warren Haynes", "David Bowie"]
    var instruments = ["Guitar", "Harmonica", "Keyboard", "Bass", "Drums"]
    var emails = ["blah@gmail.com", "blah@yahoo.com", "blah@aol.com", "blah@hotmail.com"]

    
  }




    if (path == '/user/create'){
    var x = Math.floor(Math.random() * boyMusician.length);
    var boyMusician_in_json = JSON.stringify(boyMusician[x]);
    response.end(boyMusician_in_json);
 