<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!-- Header -->
<header id="header" class="full-header">
  <div id="header-wrap">
    <div class="container clearfix">
      <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

      <!-- Logo -->
      <div id="logo">
        <a
          href="index.jsp"
          class="standard-logo"
          data-dark-logo="images/LOGO1.png"
          ><img src="images/LOGO1.png" alt="SQUAD Logo"
        /></a>
      </div>
      <!-- #logo end -->

      <!-- Primary Navigation -->
      <nav id="primary-menu">
        <ul>
          <li class="current">
            <a href="index.jsp">
              Home
            </a>
          </li>
          <li>
            <a href="aboutUs.jsp">
              About Us
            </a>
          </li>
          <li class="mega-menu">
            <a href="contactUs.jsp">
              Contact Us
            </a>
          </li>
          <%
          if((session.getAttribute("non-teaching")!=null)||(session.getAttribute("teaching")!=null)||(session.getAttribute("admin")!=null)
          ||(session.getAttribute("superAdmin")!=null)) {
          if((session.getAttribute("non-teaching")!=null)||(session.getAttribute("teaching")!=null))
          {%>
          <li>
            <a href="employeeMain.jsp">
              Profile
            </a>
          </li>
          <% }else if(session.getAttribute("admin")!=null) { %>
          <li>
            <a href="adminMain.jsp">
              Profile
            </a>
          </li>
          <% } else {%>
          <li>
            <a href="superAdminMain.jsp">
              Profile
            </a>
          </li>
          <%} %>
          <li>
            <a href="changeSettings.jsp">
              Change password
            </a>
          </li>
          <li>
            <a href="logout">
              Logout
            </a>
          </li>
          <% }else{ %>
          <li>
            <a href="login.jsp">
              Login
            </a>
          </li>
          <% } %>
        </ul>
      </nav>
    </div>
  </div>
</header>
<!-- #header end -->
