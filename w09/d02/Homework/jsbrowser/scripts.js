var xhr = new XMLHttpRequest();

    xhr.open('GET', 'http://localhost:2000/names')

    xhr.addEventListener('load', function(name) {
        // console.log(xhr.response);
        var list = xhr.response;
        var ul = document.createElement("ul");
        var li = document.createElement("li")
        li.innerText = li.list;
        document.body.appendChild(ul)
        ul.appendChild(li)


    });

  xhr.send();