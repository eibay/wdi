var ordinaryPeople = [];

String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

Array.prototype.randomIndex = function() {
	var randomFloatingIndex = Math.random() * this.length; 
	var randomIndex = Math.floor(randomFloatingIndex);
	return randomIndex; 
}

Array.prototype.randomValue = function() {
	return this[this.randomIndex()]; 
}

function generateRandomString(length) {
	return Math.random().toString(36).replace(/[0-9\.]/g, '').substring(0,length).capitalize();
}

var genderData = ['male', 'female', 'transgendered'];

function generateOrdinaryPerson() {
	var firstName = generateRandomString(7); // "Clayton".length => 7
	var lastName = 	generateRandomString(9); // "Albachten".length => 9  
	var gender = genderData.randomValue(); 
	var ordinaryPerson = {
		first_name: firstName,
		last_name: lastName,
		gender: gender
	}
	ordinaryPeople.push(ordinaryPerson); 
}