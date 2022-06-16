<%@include file = "connectsql.jsp" %> 
<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
    if( !phone.substring(0,2).equals("09") || lang != 10 || name.length() > 16 || name.equals("") || name==null ||
    email.length() > 128  ){%>
        <script src="../assets/js/changefail.js"></script>
    <%}
    else{
        if( session.getAttribute("mem_account") != null && !session.getAttribute("mem_account").equals("") ) {
            
            String acc = session.getAttribute("mem_account").toString();
            sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='"+acc+"'";
            ResultSet rs = con.createStatement().executeQuery(sql);
            rs.next();
            String id = rs.getString("mem_id");
            PreparedStatement ps;
            if(birth!=null){
                SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" ); 
                java.util.Date d = sdf.parse(birth); 
                java.sql.Date d1 = new java.sql.Date(d.getTime()); 
                java.util.Date date = new java.util.Date();
                java.sql.Date now1 = new java.sql.Date(date.getTime()); 
                boolean a =d1.before(now1);

                if(!a){
                    %>
                        <script type="text/javascript">
                            alert("生日請勿超過今日日期");
                            history.back();
                        </script>                 
                    <%
                }
                sql = "UPDATE `mem_infor` SET `mem_name` = ?, `mem_email`=?, `mem_phone`=?,`mem_birth`=? WHERE `mem_id` ='"+ id+"'";

                ps= con.prepareStatement(sql) ;
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, birth);
                
               
               
            }
            else{
                sql = "UPDATE `mem_infor` SET `mem_name` =?, `mem_email`=?, `mem_phone`=? WHERE `mem_id` ='"+ id+"'";
                ps= con.prepareStatement(sql) ;
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
            }
             
            int change = ps.executeUpdate();
            //int change = con.createStatement().executeUpdate(sql);
            if(change>0){
                con.close();%>
                <script>
                    alert("更新成功");
                    location.href="../src/memInfo.jsp";  
                </script>
                <%
            }
        }
        else{
            response.sendRedirect("login.jsp");
        }
    }

%>