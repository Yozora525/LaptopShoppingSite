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
    if(session.getAttribute("mem_account")!=null||!session.getAttribute("mem_account").equals("")){

        PreparedStatement ps;
        
        sql = "DELETE FROM `orders` WHERE `order_id`=?";
        ps = con.prepareStatement(sql);

        ps.setString(1, oid);
        int d = ps.executeUpdate();

        sql = "DELETE FROM `order_details` WHERE `order_id`=?";
        ps = con.prepareStatement(sql);

        ps.setString(1, oid);
        int d1 = ps.executeUpdate();

        if(d1>0&&d>0){
            con.close();
            %>
            <script type="text/javascript">
                alert("訂單刪除成功");
                location.href="../src/memInfo.jsp";
            </script>
            <%
        }
        else{
            %>
            <script type="text/javascript">
                alert("訂單刪除失敗");
                location.href="../src/memInfo.jsp";
            </script>
            <%
        }
    }
    else{
        response.sendRedirect("login.jsp");
    }

%>