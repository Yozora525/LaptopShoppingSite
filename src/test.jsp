<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%-- <%@include file = "connectsql.jsp" %>  --%>
<%-- 
<link rel="stylesheet" href="../assets/sass/common.css" />
<link rel="stylesheet" href="../assets/sass/backstage.css" /> --%>
<%
    Class.forName("com.mysql.jdbc.Driver");	  
    String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con = DriverManager.getConnection(url,"root","1234");
    String sql = "USE `test_computer_shop`";
    con.createStatement().execute(sql);
    String pwd = request.getParameter("pwd");
    out.println(pwd);
    //sql = "SELECT * FROM `manager`";
    
    sql = "INSERT INTO `manager` VALUES ('" + pwd + "'" ;
    //int change = con.createStatement().executeUpdate(sql);

    
    //if ( change > 0 ) 
       // out.println("新增成功<a href='backstage.jsp'>回清單</a>");
    con.close();
%>
<%-- 
    // 創產品id
    request.setCharacterEncoding("UTF-8");
    sql = "SELECT COUNT(*) FROM `product_infor`";
    ResultSet rs = con.createStatement().executeQuery( sql );
    rs.next();
    int total = rs.getInt( 1 )+1;
    out.println( total );
    String n="";
    String idn="";

    if( total > 0 && total < 10){
        n = Integer.toString(total);
        idn = "000"+ n;
    }
    else if( total < 100 && total >= 10 ){
        n = Integer.toString(total);
        idn = "00"+ n;
    }
    else if ( total >= 100 && total < 1000 ){
        n = Integer.toString(total);
        idn = "0"+ n;        
    }

    String id = "P" + idn;
    out.println(id);
 --%>