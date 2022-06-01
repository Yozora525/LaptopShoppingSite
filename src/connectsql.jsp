<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@include file = "catchDateRan.jsp" %> 

<%
    request.setCharacterEncoding("UTF-8");
    try{
        Class.forName("com.mysql.jdbc.Driver");	  
        try{
        	String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url,"root","1234");

            if(con.isClosed()){
                out.println("connection fail ");
            }
            else{
                out.println("connection success ");


                String sql = "USE `computer_shop`";
                con.createStatement().execute(sql);

                //抓前端輸入帳號密碼
                String logacc = request.Parameter("account_log");
                String logpas = request.Parameter("password_log");

                if( logacc.equals != "" && logpas.equals != "" ){
                    
                }
                //http://localhost:8080/LaptopShoppingSite/src/connectsql.jsp
                //抓前端輸入帳號密碼
                String regacc = request.Parameter("account_reg"); 
                String regpas = request.Parameter("password_reg");

                String memid = "MEM" + CDATE ; // 處理memid CDate來自catchDataRan.jsp

                sql = "INSERT INTO `login` VALUES (memid, regacc, regpas)";
                int y = con.createStatement().execute(sql); #執行成功傳回false
                sql = "INSERT INTO mem_infor VALUES (memid,'', '', '', '', '', regacc)";
                int y1 = con.createStatement().execute(sql); #執行成功傳回false

            }
            con.close();
        }
        catch(SQLException sExec){
            out.println("sql error "+ sExec.toString());
        }
    }
    catch(ClassNotFoundException err){
        out.println("class error "+ err.toString());
    }

%>