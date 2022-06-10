<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@include file = "connectsql.jsp" %> 
<%
    session.removeAttribute("man_account");
    response.sendRedirect("index.jsp");
%>