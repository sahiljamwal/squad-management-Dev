<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<footer id="footer">
  <div id="footer">
    <div class="container clearfix">
      <div class="col_half">
        <div class="copyright-links">
          <a href="index.jsp">Home</a> / <a href="aboutUs.jsp">About Us</a>/
          <a href="contactUs.jsp">Contact Us</a>
          <%
          if((session.getAttribute("non-teaching")!=null)||(session.getAttribute("teaching")!=null)||(session.getAttribute("admin")!=null)
          ||(session.getAttribute("superAdmin")!=null)) {%>/
          <a href="changeSettings.jsp">Change Password</a> /
          <a href="logout">Logout</a><% }%>
        </div>
      </div>

      <div class="col_half col_last tright">
        <i class="icon-envelope2"></i> msitlm.19@gmail.com
        <span class="middot">&middot;</span>
        <i class="icon-headphones"></i> +91-7889595329<span class="middot"
          >&middot;</span
        >
        <i class="icon-headphones"></i> +91-9971227534<span class="middot"
          >&middot;</span
        >
      </div>
    </div>
  </div>
</footer>
