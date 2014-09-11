function initials(full_name){
 var split_name = full_name.split(" ")
 x=0
 var initials = []
 while (x < split_name.length) {
 	initials.push(split_name[x][0])
 	x += 1
 } return initials
}

console.log(initials("Tess Danielle Shapiro"))