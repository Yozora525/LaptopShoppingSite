<%@include file = "connectsql.jsp" %> 
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.sql.*"%>
<%
    String pname = request.getParameter("product"); 
    int quan  = Integer.parseInt(request.getParameter("quan")); 
    int index=0;
    while ( (index= pname.indexOf("%20")) != -1 || (index= pname.indexOf("+")) != -1 ) {
        pname = pname.substring(0,index) + " " + pname.substring(index+1);
    }
    String sql0 = "SELECT `product_id`,`product_amount` FROM `product_infor` WHERE `product_name`='" + pname + "'";
    ResultSet rsid = con.createStatement().executeQuery(sql0);
    rsid.next();
    String pid = rsid.getString("product_id");
    int store = rsid.getInt("product_amount");
    String acc = session.getAttribute("mem_account").toString();
    sql = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + acc + "'";
    //sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='adsasddsa@gmail.com'";
    ResultSet rs = con.createStatement().executeQuery(sql);
    rs.next();
    String id = rs.getString("mem_id");
    if( store > quan || store == quan){
        sql0 = "UPDATE `cart` SET `order_amount`='"+quan+"' WHERE `mem_id`='"+ id +"' AND `product_id`='"+pid+"'";
        con.createStatement().execute(sql0);
        int change = con.createStatement().executeUpdate(sql0);
        if(change>0){
            con.close();
            response.sendRedirect("car.jsp");
        }
    }
    else{
        sql0 = "UPDATE `cart` SET `order_amount`='"+store+"' WHERE `mem_id`='"+ id +"' AND `product_id`='"+pid+"'";
        con.createStatement().execute(sql0);
        int change = con.createStatement().executeUpdate(sql0);
        if(change>0){
            con.close();
            response.sendRedirect("car.jsp");
        }
    }
    
%>