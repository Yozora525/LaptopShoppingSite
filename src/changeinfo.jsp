<%@include file = "connectsql.jsp" %> 
<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("mname");
    String email = request.getParameter("memail");
    String phone = request.getParameter("mphone");
    String birth = request.getParameter("mbirth");
    if( session.getAttribute("mem_account") != null) {
        
        String acc = session.getAttribute("mem_account").toString();
        sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='"+acc+"'";
        ResultSet rs = con.createStatement().executeQuery(sql);
        rs.next();
        String id = rs.getString("mem_id");
        sql = "UPDATE `mem_infor` SET `mem_name` = '" + name + "', `mem_email`='"+email+ "', `mem_phone`='"+phone+"',`mem_birth`='"+birth+"'"+" WHERE `mem_id` ='"+ id+"'";
        
        int change = con.createStatement().executeUpdate(sql);
        if(change>0){
            con.close();
            response.sendRedirect("memInfo.jsp");
        }
        

    }


%>