<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@include file = "catchDateRan.jsp" %> 
<%

    String racc = request.getParameter("racc"); 
    String rpwd = request.getParameter("rpwd");

    String memid = "MEM" + CDATE ; // 處理memid CDate來自catchDataRan.jsp
    if(racc !=null && !racc.equals("") && rpwd != null && !rpwd.equals("")){
        
        sql = "INSERT INTO `login` VALUES ( '"+memid+"', '"+racc+"', '"+rpwd+"')";
        con.createStatement().execute(sql); 
        int y = con.createStatement().executeUpdate(sql);
        sql = "INSERT INTO `mem_infor` VALUES ( '"+ memid + "','', '', '', '', '', '" + racc + "')";
        con.createStatement().execute(sql); 
        int y1 = con.createStatement().executeUpdate(sql);
        if ( y1>0 && y2 > 0 ){
            con.close();
            out.println("註冊成功<a href='login.jsp'>按此登入</a>") ;
        }
    }
    else
	    response.sendRedirect("login.jsp");
%>