<script type="text/javascript">
var test = [];
var page_path = window.location.pathname;
page_path = page_path.split("/")[1];

$.get('/ny-baby-names.json', function(result){
    var ajax_result = result;
    for(var i=0;i<result.data.length;i++){
      ajax_result.data[i][8] == page_path  ?
      $("table").append("<tr>" + "<td>"+ajax_result.data[i][9]+"</td>" + "<td>"+ajax_result.data[i][10]+"</td>"+ "<td>"+ajax_result.data[i][11]+"</td>"+ "<td>"+ajax_result.data[i][12]+"</td>"+ "</tr>")
        // test.push(result.data[i])
         : console.log();
      }
    }, "json"
  );
  // var xhr = new XMLHttpRequest;
  // xhr.open('GET', '/ny-baby-names.json', true );
  // xhr.send();
  // xhr.addEventListener('load', function(e){
  //   console.log(xhr.response);
  // });
</script>