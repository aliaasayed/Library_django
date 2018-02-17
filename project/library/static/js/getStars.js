function get_stars(rate)
  {
    
   var stars = document.getElementsByClassName("fa")
    var counter=1;
    for(var i=0;i<5;i++)
    { 
      if(counter <= rate)
      {
        stars[i].className= "fa fa-star checked"
        counter++;
      }
      
    }

  }
 
  function star_check(book_pk,star_id)
{
 
  var stars_book=document.getElementsByClassName("fa");
  var len=stars_book.length;
  var myform=document.getElementById('myForm');
  var id_input=document.getElementById('book_pk');
  var rate_input=document.getElementById('rating');
 

  for (var i=0;i<len;i++)
  {  
      if(i<star_id)
      {
          stars_book[i].className = "fa fa-star checked"
      }
      else
      { 
          stars_book[i].className = "fa fa-star"

      }

  }

  rate_input.value=star_id
  id_input.value=book_pk
  myform.submit()
} 