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

        sql= "SELECT `mem_account` FROM `login` WHERE `mem_account`='"+racc+"'";
        ResultSet rsp = con.createStatement().executeQuery(sql);
        int y=0,y1=0;
        if( !rsp.next() ){
            sql = "INSERT INTO `mem_infor` VALUES ( '"+ memid + "','', '', '', '0000-00-00', '"+credate+"', '"+racc+"')";
            
            y1 = con.createStatement().executeUpdate(sql);
            sql = "INSERT INTO `login` VALUES('"+memid+"', '"+racc+"', '"+rpwd+"')";
            
            y = con.createStatement().executeUpdate(sql);
        }
        else{
            out.println("註冊失敗，請再試一次<a href='login.jsp'>回登入介面</a>");
        }
        
        if ( y1>0 && y > 0 ){
            con.close();
            out.println("註冊成功<a href='memInfo.jsp'>按此填寫會員資料</a>") ;
        }
    }
    else
	    response.sendRedirect("login.jsp");
%>