<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 
<%
    sql = "SELECT `product_id`,`product_name`, `product_status` FROM `product_infor` WHERE `product_id`";
    ResusltSet rs = con.createStatement().executeQuery(sql);

%>