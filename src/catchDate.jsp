<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%
    SimpleDateFormat time = new SimpleDateFormat("yyyyMMddhhmmss");
    String CreateDate = time.format(new Date());
    out.print(CreateDate);
%>
