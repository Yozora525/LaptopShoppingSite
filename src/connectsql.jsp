<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<html>
    <head>
        <title>connectsql</title>
    </head>
    <body>
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


                sql = "USE `computer_shop`";
                con.createStatement().execute(sql);

                String logacc = request.Parameter("account_log");
                String logpas = request.Parameter("password_log");
                String regacc = request.Parameter("account_reg");
                String regpas = request.Parameter("password_reg");

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
</body>
</html>