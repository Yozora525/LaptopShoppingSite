<%@include file = "connectsql.jsp" %> 
<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
    String ppwd = request.getParameter("prepwd");
    String npwd = request.getParameter("newpwd");
    //if( session.getAttribute("mem_account") != null) {
        sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='adsasddsa@gmail.com' AND `mem_password`='"+ppwd+"'";
        ResultSet rs = con.createStatement().executeQuery(sql);
        rs.next();
        String id = rs.getString("mem_id");
        if( !id.equals("") && id != null ){
            sql = "UPDATE `login` SET `mem_password` = '" + npwd +"' WHERE `mem_id` ='"+ id+"'";
            int change = con.createStatement().executeUpdate(sql);
            if(change>0){
                con.close();
                response.sendRedirect("memInfo.jsp");
            }
        }
        else{
            out.println("密碼更改失敗<a href='memInfo.jsp'>回會員中心</a>");
        }
        

    //}


%>