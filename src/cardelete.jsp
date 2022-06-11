<%@include file = "connectsql.jsp" %> 
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String pname = request.getParameter("product"); 
    int index=0;
    while ( (index= pname.indexOf("%20")) != -1 || (index= pname.indexOf("+")) != -1 ) {
        pname = pname.substring(0,index) + " " + pname.substring(index+1);
    }

    String sql0 = "SELECT `product_id` FROM `product_infor` WHERE `product_name`='" + pname + "'";
    ResultSet rsid = con.createStatement().executeQuery(sql0);
    rsid.next();
    String pid = rsid.getString("product_id");
    String acc = session.getAttribute("mem_account").toString();
    sql = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + acc + "'";
    ResultSet rs = con.createStatement().executeQuery(sql);
    rs.next();
    String id = rs.getString("mem_id");

    sql = "DELETE FROM `cart` WHERE `mem_id`='"+ id +"' AND `product_id`= '"+pid+"'";
    con.createStatement().execute(sql);

    int change = con.createStatement().executeUpdate(sql);
    sql = "SELECT * FROM cart WHERE mem_id ='"+id+"' AND product_id='"+pid+"'";
    ResultSet crs = con.createStatement().executeQuery(sql);
    

    if( change > 0 || !crs.next() ){
        con.close();
        response.sendRedirect("car.jsp");    
    }
    else{
        out.println("刪除失敗<a href='car.jsp'>回購物車</a>");
    }
%>