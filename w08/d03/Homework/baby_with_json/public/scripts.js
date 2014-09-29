function AJAX(){
var path = $(location).attr('pathname');
$.get("information/"+ path, function(data){
  var info = JSON.parse(data)
  drop = []
  if (info.length == 0){
    $('.babyNames').append("<h1> NO INFORMATION FOR THAT YEAR </h1>")
  }else { 
    $('.babyNames').append("<h1>BABY NAMES OF "+info[0][8]+"</h1>")
    _.each(info, function (information, i) {
      if(drop.indexOf(information[10]) == -1){
        drop.push(information[10])
      }
    $('<tr>').html("<td>" + information[9] + "</td><td>" + information[10] + "</td><td>" + information[11] + "</td><td>" + information[12] + "</td>").appendTo('.record');
    })
    dropDown(drop,info)
  }
  
})
}
// var path = window.location.pathname in javascript

//     $.each(info, function (i, information) {
//     $('<tr>').html("<td>" + information[9] + "</td><td>" + information[10] + "</td><td>" + information[11] + "</td><td>" + information[12] + "</td>").appendTo('.record');
//     })
//     })
// }
// jquery puts i first while underscore you put information first
//both work!!!!!!!!!!


AJAX()


function dropDown(array, info){
   _.each(array, function(options, i){
    var option1 = options.replace(/\s/g, '');
  $('.counties').append("<option value="+ option1 +">"+options+"</option>")
})
   $('.maleFemale').append("<option value=M>MALE</option>"+"<option value=F>FEMALE</option>")
   Event(info)
   eventSex(info)

 }
  

function Event(info){
  $('.byCounty').click(function(event) {
    $('.record tr').empty()
    var location = event.target.parentNode.children[0].value
        _.each(info, function (information, i) {
          if(information[10].replace(/\s/g, '') == location){
        $('<tr>').html("<td>" + information[9] + "</td><td>" + information[10] + "</td><td>" + information[11] + "</td><td>" + information[12] + "</td>").appendTo('.record');
        }
      })
      })
}

function eventSex(info){
  $('.bySex').click(function(event) {
    $('.record tr').empty()
    var sex = event.target.parentNode.children[2].value
        _.each(info, function (information, i) {
          if(information[11] == sex){
            $('<tr>').html("<td>" + information[9] + "</td><td>" + information[10] + "</td><td>" + information[11] + "</td><td>" + information[12] + "</td>").appendTo('.record');
        }
      })
      })
}











