<%@include file = "connectsql.jsp" %> 
<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page language="java"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%
    String name = request.getParameter("mname");
    String email = request.getParameter("memail");
    String phone = request.getParameter("mphone");
    String birth = request.getParameter("mbirth");
    int lang=phone.length();
    //
    if( !phone.substring(0,2).equals("09") ||lang != 10 ){%>
        <script src="../assets/js/changefail.js"></script>
    <%}
    else{
        if( session.getAttribute("mem_account") != null && !session.getAttribute("mem_account").equals("") ) {
            
            String acc = session.getAttribute("mem_account").toString();
            sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='"+acc+"'";
            ResultSet rs = con.createStatement().executeQuery(sql);
            rs.next();
            String id = rs.getString("mem_id");
            if(birth!=null){
                sql = "UPDATE `mem_infor` SET `mem_name` = '" + name + "', `mem_email`='"+email+ "', `mem_phone`='"+phone+"',`mem_birth`='"+birth+"' WHERE `mem_id` ='"+ id+"'";
            }
            else{
                sql = "UPDATE `mem_infor` SET `mem_name` = '" + name + "', `mem_email`='"+email+ "', `mem_phone`='"+phone+"' WHERE `mem_id` ='"+ id+"'";
            }
            
            int change = con.createStatement().executeUpdate(sql);
            if(change>0){
                con.close();%>
                <script>
                    alert("更新成功");
                    location.href="../../src/memInfo.jsp";  
                </script>
                <%
                response.sendRedirect("memInfo.jsp");
            }
        }
        else{
            response.sendRedirect("login.jsp");
        }
    }

%>