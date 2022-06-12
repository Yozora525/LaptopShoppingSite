<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@include file = "connectsql.jsp" %> 

<%
    String lacc = request.getParameter("lacc");
    String lpwd = request.getParameter("lpwd");
    ResultSet rs;
    PreparedStatement ps;

   if( lacc !=null && !lacc.equals("") && lpwd != null && !lpwd.equals("")){ 
    
        sql = "SELECT `mem_account`,`mem_password` FROM `login` WHERE `mem_account`=? AND `mem_password`=?";

        ps = con.prepareStatement(sql);

        ps.setString(1, lacc);
        ps.setString(2, lpwd);

        rs = ps.executeQuery();

        if(rs.next()){            
            session.setAttribute("mem_account", lacc);
            con.close();
            response.sendRedirect("memInfo.jsp") ;
        }
        else{
            con.close();
            out.println("帳號密碼不符<a href='login.jsp'>重新登入</a>") ;
        }
    }
    else{%>
        <script>alert("註冊成功，請填寫會員資料");</script>
    <%
	    response.sendRedirect("login.jsp");}

%>