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
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");              

                    String accountmail = session.getAttribute("mem_account").toString();   
                    Integer quantity=Integer.parseInt(request.getParameter("quantity"));
                    String productid = request.getParameter("proID");
                    
                    String sqlac = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + accountmail + "'";
                    ResultSet rs1 = con.createStatement().executeQuery(sqlac);
                    rs1.next();
                    String id = rs1.getString("mem_id");

                    String sqlc= "SELECT * FROM `cart` WHERE (`mem_id`='"+id+"') AND (`product_id`='"+ productid + "')";
                    ResultSet rscart = con.createStatement().executeQuery(sqlc);
                    int c=0;
                    if( !rscart.next() ){
                        String sqln = "INSERT INTO `cart` VALUES ( '"+ id + "','"+ productid + "', '"+ quantity + "')";   
                        c = con.createStatement().executeUpdate(sqln);
                    }
                    else{
                        String sqlu = "UPDATE `cart` SET `order_amount`= `order_amount`+"+ quantity + " WHERE (`mem_id`='"+id+"') AND (`product_id`='"+ productid + "')";
                        c = con.createStatement().executeUpdate(sqlu);
                    }
                    
                    if ( c > 0 ){ %>
                        <script type="text/javascript">
                            alert("商品已加入購物車！");
                            history.back();
                        </script>                 
                    <%
                    }
                }
            %>
