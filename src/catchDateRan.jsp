<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%
    SimpleDateFormat time = new SimpleDateFormat("yyyyMMddhhmmss");  
    String CDate = time.format(new Date()); 
    
    //out.println(CDate);
    int num = Math.round( (float)Math.random()*1000);
    while ( num < 100){
        num = Math.round( (float)Math.random()*1000);
    }
    String RanNum = "" + num;
    CDate += RanNum;
    out.println(CDate);
%>
