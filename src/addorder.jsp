<%@ include file = "catchDateRan.jsp" %> 
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%
    if( session.getAttribute("mem_account")==null || session.getAttribute("mem_account").equals("") ){
        response.sendRedirect("login.jsp");
    }
    else{
        
%>
<%-- 製作流水號 --%>
<%
    String oid = "order" + CDate ; // CDate來自catchDataRan.jsp
    //out.println(oid+"<br>");
    String[] name = request.getParameterValues("item-name");
    String[] price = request.getParameterValues("item-price");
    String[] quan = request.getParameterValues("item-quan");
    String[] tupri = request.getParameterValues("item-revenue");
    int k = name.length;
    String addr = request.getParameter("addr");
    String pay = request.getParameter("pay-revenue");

    sql= "SELECT `order_id` FROM `orders` WHERE `order_id`='"+oid+"'";
    ResultSet rsi = con.createStatement().executeQuery(sql);
    while(rsi.next()){
        num = Math.round( (float)Math.random()*1000);
        while ( num < 100){
            num = Math.round( (float)Math.random()*1000);
        }
        RanNum = "" + num;
        CDate += RanNum;
        oid = "order" + CDate ;
    }
%>
<%-- 添加訂單詳情 --%>
<%// 找ID存進去 
    String[] pid = new String[k];
    int change=0;
    for(int i = 0 ; i < k ; i++){
        out.println(name[i]+price[i]+quan[i]+tupri[i]+"<br>");
        
        sql="SELECT `product_id` FROM `product_infor` WHERE `product_name`='"+name[i]+"'";
        ResultSet rsid = con.createStatement().executeQuery(sql);
        rsid.next();
        pid[i] = rsid.getString("product_id");

        int tquan = Integer.parseInt(quan[i]);
        sql = "INSERT INTO `order_details` VALUES ('"+oid+"','"+pid[i]+"','"+credate+"',?,'"+tquan+"')";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,addr);
        change = ps.executeUpdate();
        //change = con.createStatement().executeUpdate(sql);
        if( !(change>0) ){
            out.println(oid+"訂單詳情新增失敗");
        }
    }
%>
<%-- 訂單清單 --%>
<%
    int change1=0;
    String acc = session.getAttribute("mem_account").toString();
    sql = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + acc + "'";
    ResultSet rs1 = con.createStatement().executeQuery(sql);
    rs1.next();
    String id = rs1.getString("mem_id");
    int tprice = Integer.parseInt(pay);
    sql = "INSERT INTO `orders` VALUES ('"+oid+"', '"+id+"','"+tprice+"')";
    change1 = con.createStatement().executeUpdate(sql);
    if( !(change1>0) ){
        out.println(oid+"訂單新增失敗");
    }
%>
<%-- 減少庫存 增加銷售量 先取庫存再減掉傳來的值 再重設值回去--%>
<%
    int change2=0;
    int y, tquan;
    int stored=0;
    int sale = 0;
    for(int i = 0 ; i < k ; i++){
        sql = "SELECT `product_id`,`product_amount`,`product_sold` FROM `product_infor` WHERE `product_id`='" + pid[i] + "'";
        ResultSet rsa = con.createStatement().executeQuery(sql);
        rsa.next();
        stored = rsa.getInt("product_amount");
        tquan = Integer.parseInt(quan[i]);
        stored -= tquan;
        sale = rsa.getInt("product_sold");
        sale += tquan;
        sql = "UPDATE `product_infor` SET `product_amount`='"+stored+"',`product_sold`='"+sale+"' WHERE `product_id`='"+pid[i]+"'";
        con.createStatement().execute(sql);
        y = con.createStatement().executeUpdate(sql);
        if ( y > 0 ){
            change2=1;
        }
        else{
            out.println(pid[i]+"庫存減少失敗");
        }
    }
    

%>
<%-- 刪掉car的商品 --%>
<%
    int change3=0;
    int a;
    for( int i = 0 ; i < k ; i++ ){
        sql = "DELETE FROM `cart` WHERE `mem_id`='"+ id +"' AND `product_id`= '"+pid[i]+"'";
        con.createStatement().execute(sql);
        a = con.createStatement().executeUpdate(sql);
        sql = "SELECT * FROM cart WHERE mem_id ='"+id+"' AND product_id='"+pid+"'";
        ResultSet crs = con.createStatement().executeQuery(sql);

        if( a>0 || !crs.next() ){
            change3 =1;
        }
        else{
            out.println(i+"刪除失敗");
        }
    }

    

%>
<%-- 如果四件事都完成就關連線 --%>
<%
    if( change > 0 && change1 > 0 && change2 > 0 &&  change3 > 0 ) {
        con.close();
        response.sendRedirect("finish.jsp");
    }
    else{
        response.sendRedirect("到聯絡我們以幫您解決問題 <a href='about.jsp'>回報問題</a>");
    }
%>
<%}%>













<%-- 爽拉終於結束了 --%>