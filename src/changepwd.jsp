<%@include file = "connectsql.jsp" %> 
<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
    String ppwd = request.getParameter("prepwd");
    String npwd = request.getParameter("newpwd");
    if( session.getAttribute("mem_account") != null) {

        String acc = session.getAttribute("mem_account").toString();
        sql = "SELECT `mem_id`,`mem_account`,`mem_password` FROM `login` WHERE `mem_account` ='"+acc+"' AND `mem_password`=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, ppwd);
        ResultSet rs = ps.executeQuery();
        rs.next();
        String id = rs.getString("mem_id");
        if( !id.equals("") && id != null ){
            sql = "UPDATE `login` SET `mem_password` = ? WHERE `mem_id` ='"+ id+"'";
            ps = con.prepareStatement(sql);
            ps.setString(1, npwd);
            int change = ps.executeUpdate();
            //int change = con.createStatement().executeUpdate(sql);
            if(change>0){
                con.close();
                response.sendRedirect("memInfo.jsp");
            }
        }
        else{
            out.println("密碼更改失敗<a href='memInfo.jsp'>回會員中心</a>");
        }
        

    }


%>