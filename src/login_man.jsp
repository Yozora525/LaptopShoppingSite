<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@include file = "connectsql.jsp" %> 
<%
    String acc = request.getParameter("acc");
    String pwd = request.getParameter("pwd");
    ResultSet rs;
    PreparedStatement ps;
   if( acc !=null && !acc.equals("") && pwd != null && !pwd.equals("")){ 
    
        sql = "SELECT `man_account`,`man_password` FROM `manager` WHERE `man_account`= ? AND `man_password`= ? ";

        ps = con.prepareStatement(sql);

        ps.setString(1, acc);
        ps.setString(2, pwd);

        rs = ps.executeQuery();

        if(rs.next()){            
            session.setAttribute("man_account", acc);
            con.close();
            response.sendRedirect("backstage.jsp") ;
        }
        else{
            con.close();
            %>
            <script type="text/javascript">
                alert("帳號密碼不符，請重新登入");
                history.back();
            </script>                 
            <%
        }
    }
    else
	    response.sendRedirect("manage.jsp");

%>