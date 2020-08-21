<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	HttpSession user = request.getSession(false);
if (user.getAttribute("superAdmin") != null) {
} else if (user.getAttribute("teaching") != null || user.getAttribute("non-teaching") != null) {
	RequestDispatcher rd = request.getRequestDispatcher("/employeeMain.jsp");
	rd.forward(request, response);
} else if (user.getAttribute("admin") != null) {
	RequestDispatcher rd = request.getRequestDispatcher("/adminMain.jsp");
	rd.forward(request, response);
} else {
	RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
	rd.forward(request, response);
}
%>
