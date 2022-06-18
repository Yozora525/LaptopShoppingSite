<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String oid = request.getParameter("oid");
    sql = "SELECT `rstatus` FROM `orders` WHERE `order_id`=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,oid);
    ResultSet rs5 =ps.executeQuery();
    rs5.next();
    int i = 0;
    if(rs5.getInt("rstatus")==0){
        sql = "UPDATE `orders` SET `rstatus`=1 WHERE `order_id` =?";
        i = 0;
    }
    else{
        sql = "UPDATE `orders` SET `rstatus`=0 WHERE `order_id` =?";
        i = 1;
    }
   

    ps= con.prepareStatement(sql) ;
    ps.setString(1, oid);
    int change = ps.executeUpdate();
    if(change>0){
        con.close();
        if(i==0){
        %>
        <script>
            alert("退貨請求已送出");
            location.href="../src/memInfo.jsp";  
        </script>
        <%
        }
        else if(i==1){
        %>
        <script>
            alert("退貨請求已取消");
            location.href="../src/memInfo.jsp";  
        </script>
        <%
        }
    }
%>