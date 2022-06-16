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
    String type1 = request.getParameter("type1"); 
if ( name!=null && !name.equals("") && brand!=null && !brand.equals("") &&type!=null && !type.equals("") 
         &&ssize!=null && !ssize.equals("") &&saddprotouch!=null && !saddprotouch.equals("") &&sstore!=null && !sstore.equals("") 
         &&sprice!=null && !sprice.equals("") && discript!=null && !discript.equals("") || !(brand.length()>64) || 
         !(name.length()>32) || !(type.length()>32)){

    float size = Float.valueOf(ssize).floatValue();
    int addprotouch = Integer.parseInt(saddprotouch);
    int store = Integer.parseInt(sstore);
    int price = Integer.parseInt(sprice);
    int ctype=0;
    PreparedStatement ps;
    ResultSet rs;
    if( type.equals("其他") && type1!=null ){
        if( type1!=null && !type1.equals("") ){
            sql =  "SELECT * FROM `type_list` WHERE `product_type` = ?" ;
            ps = con.prepareStatement(sql);
            ps.setString(1, type1);
            rs = ps.executeQuery();
            if( !rs.next() ){
                type = type1;
                sql = "INSERT INTO `type_list` VALUES (?)" ;
                ps = con.prepareStatement(sql);
                ps.setString(1, type1);
                ctype = ps.executeUpdate();
            }
            else{%>
                <script src="../assets/js/dupname.js"></script>
            <%}
        }
        else{
        %>
            <script src="../assets/js/notnull.js"></script>
        <%
        }
    }
    else{
        sql = "SELECT COUNT(*) FROM `product_infor`";
        rs = con.createStatement().executeQuery( sql );
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
        
        //sql = "INSERT INTO `product_infor` VALUES ('" + id + "'," ;
        //sql += "'" + name + "','" + price + "','" +  store + "','" + "1','" + discript + "','" + "0','" + size + "'," ;
        //sql += "'" + brand + "','"  + addprotouch + "','"  + price + "')" ;
        //int change = con.createStatement().executeUpdate(sql);

        sql = "SELECT `product_name` FROM `product_infor` WHERE `product_name`=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, name);  
        rs = ps.executeQuery();
        if( rs.next() ){%>
            <script src="../assets/js/dupname.js"></script>
        <%}
        else{
            sql = "INSERT INTO `product_infor` VALUES ('" + id + "'," ;
            sql += " ?,'" + price + "','" +  store + "','" + "1', ? ,'" + "0','" + size + "'," ;
            sql += "?,'"  + addprotouch + "',?)" ;
            //out.println(sql);
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, discript);
            ps.setString(3, brand);
            ps.setString(4, type);
            //rs = ps.executeQuery();
            int change = ps.executeUpdate();

            sql= "INSERT INTO `product_img` VALUES ('"+id+"', '../assets/img/pro/messageImage.jpeg', '../assets/img/pro/messageImage.jpeg')";
            
            int change2 = con.createStatement().executeUpdate(sql);

            if ( change > 0 && change2>0 ) {%>
                <script src="../assets/js/addsuccess.js"></script>
                <%
                con.close();
            }
            else{
                %>
                <script src="../assets/js/dupname.js"></script>
                <%
            }
        }
    }
    if(ctype>0){
        sql = "SELECT COUNT(*) FROM `product_infor`";
        rs = con.createStatement().executeQuery( sql );
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
        
        //sql = "INSERT INTO `product_infor` VALUES ('" + id + "'," ;
        //sql += "'" + name + "','" + price + "','" +  store + "','" + "1','" + discript + "','" + "0','" + size + "'," ;
        //sql += "'" + brand + "','"  + addprotouch + "','"  + price + "')" ;
        //int change = con.createStatement().executeUpdate(sql);

        sql = "SELECT `product_name` FROM `product_infor` WHERE `product_name`=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, name);  
        rs = ps.executeQuery();
        if( rs.next() ){%>
            <script src="../assets/js/dupname.js"></script>
        <%}
        else{
            sql = "INSERT INTO `product_infor` VALUES ('" + id + "'," ;
            sql += " ?,'" + price + "','" +  store + "','" + "1', ? ,'" + "0','" + size + "'," ;
            sql += "?,'"  + addprotouch + "',?)" ;
            //out.println(sql);
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, discript);
            ps.setString(3, brand);
            ps.setString(4, type);
            //rs = ps.executeQuery();
            int change = ps.executeUpdate();

            sql= "INSERT INTO `product_img` VALUES ('"+id+"', '../assets/img/pro/messageImage.jpeg', '../assets/img/pro/messageImage.jpeg')";
            
            int change2 = con.createStatement().executeUpdate(sql);

            if ( change > 0 && change2>0 ) {%>
                <script src="../assets/js/addsuccess.js"></script>
                <%
                con.close();
            }
            else{
                %>
                <script src="../assets/js/dupname.js"></script>
                <%
            }
        }
    }//ctype    
}
else{%>
    <script src="../assets/js/notnull.js"></script>
    <%
}
   
        
%>
</body>
</html>

