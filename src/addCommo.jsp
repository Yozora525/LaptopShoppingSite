<%@include file = "connectsql.jsp" %> 
<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    String name = request.getParameter("name");
    String brand = request.getParameter("brand");
    String type = request.getParameter("type");
    String ssize = request.getParameter("size");
    String saddprotouch = request.getParameter("add-pro-touch");
    String sstore = request.getParameter("store");
    String sprice = request.getParameter("price");   
    String discript = request.getParameter("discript");   
if ( name!=null && !name.equals("") && brand!=null && !brand.equals("") &&type!=null && !type.equals("") 
         &&ssize!=null && !ssize.equals("") &&saddprotouch!=null && !saddprotouch.equals("") &&sstore!=null && !sstore.equals("") 
         &&sprice!=null && !sprice.equals("") && discript!=null && !discript.equals("")){

    float size = Float.valueOf(ssize).floatValue();
    int addprotouch = Integer.parseInt(saddprotouch);
    int store = Integer.parseInt(sstore);
    int price = Integer.parseInt(sprice);

    sql = "SELECT COUNT(*) FROM `product_infor`";
    ResultSet rs = con.createStatement().executeQuery( sql );
    rs.next();
    int total = rs.getInt( 1 )+1;
    //out.println( total );
    String n="";
    String idn="";

    if( total > 0 && total < 10){
        n = Integer.toString(total);
        idn = "00"+ n;
    }
    else if( total < 100 && total >= 10 ){
        n = Integer.toString(total);
        idn = "0"+ n;
    }
    else if ( total >= 100 && total < 1000 ){
        n = Integer.toString(total);
        idn = ""+ n;        
    }

    String id = "P" + idn;
    
        sql = "INSERT INTO `product_infor` VALUES ('" + id + "'," ;
        sql += "'" + name + "','" + price + "','" +  store + "','" + "1','" + discript + "','" + "0','" + size + "'," ;
        sql += "'" + brand + "','"  + addprotouch + "','"  + price + "')" ;
        //out.println(sql);
        int change = con.createStatement().executeUpdate(sql);
         if ( change > 0 ) {%>
            <script src="../assets/js/addsuccess.js"></script>
            <%
            con.close();
        }

    }
    else{%>
        <script src="../assets/js/notnull.js"></script>
        <%
    }
   
        
%>
</body>
</html>

