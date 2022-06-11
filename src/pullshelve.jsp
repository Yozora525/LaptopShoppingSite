<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>商品上下架</title>
    </head>
<body>
<%
    String pname = request.getParameter("product");
    String sta = request.getParameter("bstatus");
    
        int index=0;
        while ( (index= pname.indexOf("%20")) != -1 || (index= pname.indexOf("+")) != -1 ) {
            pname = pname.substring(0,index) + " " + pname.substring(index+1);
        }
        String sql0 = "SELECT `product_id` FROM `product_infor` WHERE `product_name`='" + pname + "'";
        ResultSet rsid = con.createStatement().executeQuery(sql0);
        rsid.next();
        String pid = rsid.getString("product_id");
        sql0 = "UPDATE `product_infor` SET `product_status`='"+sta+"' WHERE `product_id`='"+pid+"'";
        con.createStatement().execute(sql0);
        int change = con.createStatement().executeUpdate(sql0);
        if(change>0){
          con.close();
          response.sendRedirect("backstage.jsp");
        }
    
%>
</body>
</html>