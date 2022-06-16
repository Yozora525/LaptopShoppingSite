<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@include file = "connectsql.jsp" %>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.sql.*"%>

<%

    String pay = request.getParameter("pay-revenue");
    out.println(pay);
%>
<%-- 
<%
    //sql = "INSERT INTO `order_details` VALUES ('oid','pid[i]','credate','addr','tquan')";
   // out.println(sql);
     sql = "0908098950";
     out.println(sql.substring(0,2));
      String name = request.getParameter("mname");
    String email = request.getParameter("memail");
    String phone = request.getParameter("mphone");
    String birth = request.getParameter("mbirth");
    out.println(name+email+phone+birth);
%> --%>
<%-- <div class="pay-revenue">
                        <%
                        int oprice = tprice;
                        if(amount>2){
                            out.println("<span style='width: 100px;color:red;'>任選兩件9折</span>");
                            tprice*=0.9;
                        }%></div>
                        <div class="pay-revenue"><%
                        out.println("<span>共 "+amount+" 件商品</span>");
                        %> </div> --%>
                        <%-- <div class="pay-revenue">
                        <%
                            out.println("<span>原價："+oprice+"</span>");
                        %> </div> --%>
<%-- 
<%
        String cname[] = request.getParameterValues("item-check");
        int ta = 0;
        try {
            ta = cname.length;
        }
        catch(Exception e){
            response.sendRedirect("car.jsp");
        }
        int[] quan= new int[ta];
        String[] pid = new String[ta];
        int[] upri = new int[ta];
        for(int i = 0 ; i < ta; i++ ){
            sql="SELECT `product_id` FROM `product_infor` WHERE `product_name`='"+cname[i]+"'";
            ResultSet rsid = con.createStatement().executeQuery(sql);
            rsid.next();
            pid[i] = rsid.getString("product_id");
            
            sql="SELECT `product_price` FROM `product_infor` WHERE `product_name`='"+cname[i]+"'";
            ResultSet rsp = con.createStatement().executeQuery(sql);
            rsp.next();
            upri[i] = rsp.getInt("product_price");

            sql = "SELECT `mem_id`, `product_id` ,`order_amount`";
            sql += " FROM `cart`";
            sql += "WHERE (`mem_id` = 'MEM20220601112045001') AND (`product_id` = '"+pid[i]+"')";
            ResultSet rs = con.createStatement().executeQuery(sql);
            rs.next();
            out.println("<div class='pay-item'>");
            out.println("<div class='item-info-name'>");       
                out.println("<input class='' name='item-name' value='"+cname[i]+"' readonly/>");     
            out.println("</div>");    
            out.println("<div class='item-info'>");   
                out.println("<input class='' name='item-price' value='"+rs.getInt("order_amount")+"' readonly/>");       
            out.println("</div>");    
            out.println(" <div class='item-info'>"); 
                out.println("<input class='' name='item-quan' value='"+rs.getInt("order_amount")+"' readonly/>");            
            out.println("</div>");  
            out.println("<div class='item-info'>");      
                out.println(" <input class=''name='item-revenue' value='"+rs.getInt("order_amount")+"' readonly/>");                            
            out.println("</div>"); 
            out.println("</div>"); 
        
            out.println("</div>");
        }
        
        for(int i = 0 ; i < ta ; i++){
            out.println(cname[i]+pid[i]+upri[i]+"<br>");
        }
%> --%>
<%-- 
<link rel="stylesheet" href="../assets/sass/common.css" />
<link rel="stylesheet" href="../assets/sass/backstage.css" /> --%>
<%-- <%
    Class.forName("com.mysql.jdbc.Driver");	  
    String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con = DriverManager.getConnection(url,"root","1234");
    String sql = "USE `test_computer_shop`";
    con.createStatement().execute(sql);
    String pwd = request.getParameter("pwd");
    out.println(pwd);
    //sql = "SELECT * FROM `manager`";
    
    sql = "INSERT INTO `manager` VALUES ('" + pwd + "'" ;
    //int change = con.createStatement().executeUpdate(sql);

    
    //if ( change > 0 ) 
       // out.println("新增成功<a href='backstage.jsp'>回清單</a>");
    con.close();
%> --%>
<%-- 
    // 創產品id
    request.setCharacterEncoding("UTF-8");
    sql = "SELECT COUNT(*) FROM `product_infor`";
    ResultSet rs = con.createStatement().executeQuery( sql );
    rs.next();
    int total = rs.getInt( 1 )+1;
    out.println( total );
    String n="";
    String idn="";

    if( total > 0 && total < 10){
        n = Integer.toString(total);
        idn = "000"+ n;
    }
    else if( total < 100 && total >= 10 ){
        n = Integer.toString(total);
        idn = "00"+ n;
    }
    else if ( total >= 100 && total < 1000 ){
        n = Integer.toString(total);
        idn = "0"+ n;        
    }

    String id = "P" + idn;
    out.println(id);
 --%>