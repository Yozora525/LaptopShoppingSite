
<%
    //sql = "SELECT `product_id`,`product_name`, `product_status` FROM `product_infor` WHERE `product_name`";
    //ResusltSet rs = con.createStatement().executeQuery(sql);
    String pname = request.getParameter("product");
    String sta = request.getParameter("bstatus");
    int index=0;
    while ( (index= pname.indexOf("%20")) != -1 ) {
        pname = pname.substring(0,index) + " " + pname.substring(index+1);
    }
    out.println(pname);
    sql = "SELECT `product_id` FROM `product_infor` WHERE `product_name`='" + pname + "'";
    ResusltSet rsid = con.createStatement().executeQuery(sql);
    rsid.next();
    String pid = rsid.getString("product_id");

    sql = "UPDATE `product_infor` SET `product_status`='"+sta+"' WHERE `product_id`='"+pid+"'";
    con.createStatement().execute(sql);
    int change = con.createStatement().executeUpdate(sql);
    if(change>0){
        con.close();
    }

%>