var stars=document.getElementsByClassName("fa")
console.log(stars)

for(var j=0;j<stars.length;j++) {
   stars[j].onclick=star_check(j,stars[j].id)
}

