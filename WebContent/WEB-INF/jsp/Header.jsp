
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Hongli Optical</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li id="headerLink1" class="headerLink active"><a href="/CSE5234/">Home</a></li>
        <li id="headerLink2" class="headerLink"><a href="/CSE5234/purchase">Purchase</a></li>
        <li id="headerLink3" class="headerLink"><a href="/CSE5234/aboutus">About</a></li>
        <li id="headerLink4" class="headerLink"><a href="/CSE5234/contactus">Contact</a></li>   
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<script>
$(function(){
console.log(window.location.pathname);
var url = window.location.pathname;
$(".headerLink").removeClass("active");
if(url == "/Lab2/"){
	$("#headerLink1").addClass("active")
} else if(url == "/CSE5234/purchase"){
	$("#headerLink2").addClass("active")
} else if(url == "/CSE5234/aboutus"){
	$("#headerLink3").addClass("active")
} else if(url == "/CSE5234/contactus"){
	$("#headerLink4").addClass("active")
}

});
</script>
</body>
</html>