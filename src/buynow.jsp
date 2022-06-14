<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import ="java.sql.*"%>
<%@include file = "catchDateRan.jsp" %>

    <%
    if(session.getAttribute("mem_account")==null||session.getAttribute("mem_account").equals("")){
                response.sendRedirect("login.jsp");
    }
    else{    
        try{
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");              

                    String accountmail = session.getAttribute("mem_account").toString();   
                    String productid = request.getParameter("proID");
                
                try{    
                    Integer quantity=Integer.parseInt(request.getParameter("quantity"));


                    //String sqlac = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='?'";
                    String sqlac = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + accountmail + "'";
                    ResultSet rs1 = con.createStatement().executeQuery(sqlac);
                    rs1.next();
                    String id = rs1.getString("mem_id");

                    
                    String sqlc= "SELECT * FROM `cart` WHERE (`mem_id`=?) AND (`product_id`=?)";
                    //String sqlc= "SELECT * FROM `cart` WHERE (`mem_id`='"+id+"') AND (`product_id`='"+ productid + "')";
                    //ResultSet rscart = con.createStatement().executeQuery(sqlc);
                    PreparedStatement pscart = con.prepareStatement(sqlc);
                    pscart.setString(1,id);
                    pscart.setString(2,productid);
                    ResultSet rscart = pscart.executeQuery();
                    
                                        
                    int c=0;
                    if( !rscart.next() ){
                        String sqln = "INSERT INTO `cart` VALUES ( ? , ? , ?)";
                        //String sqln = "INSERT INTO `cart` VALUES ( '"+ id + "','"+ productid + "', '"+ quantity + "')";   
                        //c = con.createStatement().executeUpdate(sqln);
                        PreparedStatement psincart = con.prepareStatement(sqln);
                        //ResultSet rscart = con.createStatement().executeQuery(sqlc);
                        psincart.setString(1,id);
                        psincart.setString(2,productid);
                        psincart.setInt(3,quantity);
                        c = psincart.executeUpdate();
                    }
                    else{
                        String sqlu = "UPDATE `cart` SET `order_amount`= `order_amount`+? WHERE (`mem_id`=?) AND (`product_id`=?)";
                        //String sqlu = "UPDATE `cart` SET `order_amount`= `order_amount`+"+ quantity + " WHERE (`mem_id`='"+id+"') AND (`product_id`='"+ productid + "')";
                        //c = con.createStatement().executeUpdate(sqlu);
                        PreparedStatement pstocart = con.prepareStatement(sqlu);
                        //ResultSet rscart = con.createStatement().executeQuery(sqlc);
                        pstocart.setInt(1,quantity);
                        pstocart.setString(2,id);
                        pstocart.setString(3,productid);
                        c = pstocart.executeUpdate();
                    }
                    
                    if ( c > 0 )
                        response.sendRedirect("car.jsp"); 
                    }catch(NumberFormatException ex){%>

                        <script type="text/javascript">
                            alert("操作錯誤，系統將返回產品頁");
                            window.history.go(-2);
                        </script>

                    <%} 
                    }catch (SQLException sExec){ %>

                        <script type="text/javascript">
                            alert("操作錯誤，系統將返回產品頁");
                            window.history.go(-2);
                        </script>

                <% }    
                }
                %>                      