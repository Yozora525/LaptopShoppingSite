
<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");

    String pas = request.getParameter("pwd");
    out.println(pas);

%>