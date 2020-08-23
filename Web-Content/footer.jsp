<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    /> 
  </head>
  <style>
  
.footer {
  background:#f2f2f2;
  color:black;
  bottom: 0;
  width: 100%;
  height:120px;
 font-weight: 600;

}
.footer .links ul {
  list-style-type: none;
}
.footer .links li a {
  color: black;
  -webkit-transition: color .2s;
  transition: color .2s;
}
.footer .links li a:hover {
  text-decoration: none;
  color: black;
}
.footer .about-company i {
  font-size: 25px;
}
.footer .about-company a {
  color: black;
  -webkit-transition: color .2s;
  transition: color .2s;
}
.footer .about-company a:hover {
  color: black;
}
.footer .location i {
  font-size: 18px;
}
.footer .copyright p {
  border-top: 1px solid black;
}
@media screen and (max-width:990px){
    .footer{
    height:110px;
    
    }
    .footer .links ul li{
    display:inline-block;}
}
@media screen and (max-width:731px){
    .footer{
    height:135px;
    
    }
    .footer .links ul li{
    display:inline-block;}
}

@media screen and (max-width:380px){
    .footer{
    height:110px;
    
    }
    .footer .links ul li{
    display:inline-block;}
}

@media screen and (max-width:280px){
    .footer{
    height:135px;
    
    }
    .footer .links ul li{
    display:inline-block;}
}
  </style>

  <body>
    
    <div id="footer" class=" mt-0 pt-0 pb-0 footer text-center ">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-xs-3 links float-left">
            <ul class="m-0 p-0">
              <li><a href="index.jsp">Home</a></li>
              <li><a href="aboutUs.jsp">About</a></li>
              <li><a href="contactUs.jsp">Contact Us</a></li>
               <%
              if((session.getAttribute("non-teaching")!=null)||(session.getAttribute("teaching")!=null))
              
                {%>
          <li class="nav-item">
            <a  class="nav-link" style="color:black;" href="employeeMain.jsp">
              Profile
            </a>
          </li>
          <% }else if(session.getAttribute("admin")!=null) { %>
          <li class="nav-item">
            <a class="nav-link" style="color:black;"  href="adminMain.jsp">
              Profile
            </a>
          </li>
          <% } else if(session.getAttribute("superAdmin")!=null) {%>
          <li class="nav-item">
            <a class="nav-link" style="color:black;" href="superAdminMain.jsp">
              Profile
            </a>
          </li>
          <%} else{ %>
          <li class="nav-item">
            <a class="nav-link" style="color:black;"  href="login.jsp">
              Login
            </a>
          </li>
          <%} %>
            </ul>
          </div>

          <div class="col-lg-5 col-xs-12 about-company d-none d-lg-block pb-0" >
            <h2>MSIT</h2>
            <p class="pr-5 text-black-50">
              An Institute to make your career bright.
            </p>
           
          </div>

          <div class="col-lg-4 col-xs-12 mb-0 location">
            <p class="mb-0 pt-0">
              <i class="fa fa-phone mr-3"></i>+91 7889595329
            </p>
            <p class="mb-0 pt-0 ml-4">+91 9971227534</p>
            <p><i class="fa fa-envelope-o mr-3"></i>msitlm.19@gmail.com</p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
