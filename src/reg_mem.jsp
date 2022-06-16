<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import ="java.sql.*"%>
<%@include file = "catchDateRan.jsp" %>

<%
    String racc = request.getParameter("racc"); 
    String rpwd = request.getParameter("rpwd");

    String memid = "MEM" + CDate ; // 處理memid CDate來自catchDataRan.jsp

    if( racc !=null && !racc.equals("") && rpwd != null && !rpwd.equals("")){
        
        sql= "SELECT `mem_id` FROM `login` WHERE `mem_id`='"+memid+"'";
        ResultSet rsi = con.createStatement().executeQuery(sql);
        while(rsi.next()){
            num = Math.round( (float)Math.random()*1000);
            while ( num < 100){
                num = Math.round( (float)Math.random()*1000);
            }
            RanNum = "" + num;
            CDate += RanNum;
            memid = "MEM" + CDate ;
        }

        sql= "SELECT `mem_account` FROM `login` WHERE `mem_account`=?";
        PreparedStatement ps= con.prepareStatement(sql);
        ps.setString(1, racc);
        ResultSet rsp = ps.executeQuery();
        
        int y=0,y1=0;
        if( !rsp.next() ){
            sql = "INSERT INTO `mem_infor` VALUES ( '"+ memid + "','匿名的使用者', '', '', '0000-00-00', '"+credate+"', '"+racc+"')";
            
            y1 = con.createStatement().executeUpdate(sql);
            sql = "INSERT INTO `login` VALUES('"+memid+"', '"+racc+"', '"+rpwd+"')";
            
            y = con.createStatement().executeUpdate(sql);
        }
        else{ %>
            <script src="../assets/js/rfail.js"></script>
            <%  //response.sendRedirect("login.jsp");
        } 
        int k=0;
        if ( y1>0 && y > 0 ){%>
            <%
            if(k==0){
            %>
                
        <%      k=1;
            } 
            if(k==1){
                con.close();
                response.sendRedirect("rlogin_mem.jsp?lacc="+racc+"&lpwd="+rpwd);  
            }  
        }
    }
    else{
        %>
            <script type="text/javascript">
                alert("填寫項不可為空");
                history.back();
            </script>                 
        <%
    }
%>
   