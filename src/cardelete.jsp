<%@include file = "connectsql.jsp" %> 

<%
    String pname = request.getParameter("product"); 
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
        response.sendRedirect("car.jsp");
    }
%>