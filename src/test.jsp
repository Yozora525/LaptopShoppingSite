<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@include file = "connectsql.jsp" %> 

<link rel="stylesheet" href="../assets/sass/common.css" />
<link rel="stylesheet" href="../assets/sass/backstage.css" />
<%


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