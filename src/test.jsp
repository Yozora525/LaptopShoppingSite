<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@include file = "connectsql.jsp" %> 

<link rel="stylesheet" href="../assets/sass/common.css" />
<link rel="stylesheet" href="../assets/sass/backstage.css" /><!-- /*
            sql = "SELECT `product_name` FROM `product_infor`";
            ResultSet rs=con.createStatement().executeQuery(sql);
            out.println("<form action='' method='post'>");
            out.println("<select size='1' name = 'name'>");
            while(rs.next())
                out.println("<option>" + rs.getString(1));
            out.println("</select>");
            out.println("</form>");
        out.println("<form action=''>");
        out.println("<input type='date' name='start' required/>");
        out.println("<input type='submit' value='查詢' />");
        out.println("</form>");
        String start = request.getParameter("start");
        out.println(start);
    */

    /*
    
    sql1 += "AND (`product_infor.product_name`= '"+ name + " ' ) AND ";
    sql1 += "(`order_details.order_time` BETWEEN '" + start + "' AND '" + end +"'"+ ")" ;
    */
/*
    String sql1 = "SELECT order_details.order_id, order_details.product_id, order_details.order_time, ";
    sql1 += "product_infor.product_price, order_details.howmuch, order_details.howmuch * product_infor.product_price ";
    sql1 += "FROM `product_infor`, `order_details` ";
    sql1 += "WHERE (order_details.product_id=product_infor.product_id) ORDER BY order_details.order_time  ";
    int order2 = 1;

    ResultSet rs1=con.createStatement().executeQuery(sql1);

    while(rs1.next()){
        out.println("<tr>");
        out.println("<td><span>"+ order2 +"</span></td>"); 
        out.println("<td><span>"+rs1.getString("order_details.order_id") +"</span></td>"); 
        out.println("<td><span>"+rs1.getString("order_details.order_time") +"</span></td>");
        out.println("<td><span>"+rs1.getString("order_details.product_id") +"</span></td>");
        out.println("<td><span>"+rs1.getInt("product_infor.product_price") +"</span></td>");
        out.println("<td><span>"+rs1.getInt("order_details.howmuch")+ "</span></td>");
        out.println("<td><span>"+rs1.getInt("order_details.howmuch * product_infor.product_price") +"</span></td>");
        out.println("</tr>");
        order2++;
    }  
 */         
/*
    ResultSet rs = con.createStatement().executeQuery(sql);
    out.println("<select size='1' name = 'name'>");
    while(rs.next()){
        out.println("<option>" + rs.getString(1));
    }
    out.println("</select>");
*/ -->
<%
    request.setCharacterEncoding("UTF-8");
    

%>
<%

out.println(request.getParameter("pwd"));
%><!-- /*
String sql1 = "SELECT order_details.order_id, order_details.product_id, order_details.order_time, ";
sql1 += "product_infor.product_price, order_details.howmuch, order_details.howmuch * product_infor.product_price ";
sql1 += "FROM `product_infor`, `order_details` ";
sql1 += "WHERE (order_details.product_id=product_infor.product_id)";
sql1 += "AND (`product_infor.product_name`= '"+ name + "' ) AND ";
sql1 += "(`order_details.order_time` BETWEEN '" + start + "' AND '" + end +"')  ORDER BY order_details.order_time" ;

ResultSet rs1 = con.createStatement().executeQuery(sql1);

while(rs1.next()){
    out.println("<tr>");
    out.println("<td><span>"+ order2 +"</span></td>"); 
    out.println("<td><span>"+rs1.getString("order_details.order_id") +"</span></td>"); 
    out.println("<td><span>"+rs1.getString("order_details.order_time") +"</span></td>");
    out.println("<td><span>"+rs1.getString("order_details.product_id") +"</span></td>");
    out.println("<td><span>"+rs1.getInt("product_infor.product_price") +"</span></td>");
    out.println("<td><span>"+rs1.getInt("order_details.howmuch")+ "</span></td>");
    out.println("<td><span>"+rs1.getInt("order_details.howmuch * product_infor.product_price") +"</span></td>");
    out.println("</tr>");
    order2++;
}      */  -->