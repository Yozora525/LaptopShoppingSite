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
                    String comment = request.getParameter("memcomment");
                    String productid = request.getParameter("procID");
                    
                    try{
                    Integer stars=Integer.parseInt(request.getParameter("eval-star"));  
                    
                    String sqlac = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + accountmail + "'";
                    ResultSet rs1 = con.createStatement().executeQuery(sqlac);
                    rs1.next();
                    String id = rs1.getString("mem_id");

                    String sqli= "SELECT * FROM `comment` WHERE (`mem_id`=?) AND (`product_id`=?)";
                    //String sqlc= "SELECT * FROM `cart` WHERE (`mem_id`='"+id+"') AND (`product_id`='"+ productid + "')";
                    PreparedStatement psco = con.prepareStatement(sqli);
                    //ResultSet rscart = con.createStatement().executeQuery(sqlc);
                    psco.setString(1,id);
                    psco.setString(2,productid);
                    ResultSet rsp = psco.executeQuery();
                    
                    
                    int c=0;
                    if( !rsp.next() ){
                        String sqld = "INSERT INTO `comment` VALUES ( ?,?,?, ?, '"+credate+"')";   
                        //String sqld = "INSERT INTO `comment` VALUES ( '"+ id + "','"+ productid + "', '"+ comment + "', '"+ stars + "', '"+credate+"')";   
                        //c = con.createStatement().executeUpdate(sqld);
                        PreparedStatement pscom = con.prepareStatement(sqld);
                        //ResultSet rscart = con.createStatement().executeQuery(sqlc);
                        pscom.setString(1,id);
                        pscom.setString(2,productid);
                        pscom.setString(3,comment);
                        pscom.setInt(4,stars);
                        c = pscom.executeUpdate();

                    }
                    else{
                        String sqlv = "UPDATE `comment` SET `mem_comment`=?, `star`=?, `comment_time`='"+ credate +"' WHERE `mem_id`=? AND `product_id`=?";
                        //String sqlv = "UPDATE `comment` SET `mem_comment`='"+ comment+"', `star`="+ stars +", `comment_time`='"+ credate +"' WHERE `mem_id`='"+ id + "' AND `product_id`='"+ productid + "'";
                        //c = con.createStatement().executeUpdate(sqlv);
                        PreparedStatement pscomu = con.prepareStatement(sqlv);
                        //ResultSet rscart = con.createStatement().executeQuery(sqlc);
                        pscomu.setString(1,comment);
                        pscomu.setInt(2,stars);
                        pscomu.setString(3,id);
                        pscomu.setString(4,productid);
                        c = pscomu.executeUpdate();

                    }
                    
                    if ( c > 0 )
                        response.sendRedirect("proIntro.jsp?proID="+productid);
                                } catch(NumberFormatException ex){%>

                        <script type="text/javascript">
                            alert("操作錯誤，系統將返回產品頁");
                            window.history.go(-2);
                        </script>

                    <% } 
                    }catch (SQLException sExec){ %>

                        <script type="text/javascript">
                            alert("操作錯誤，系統將返回產品頁");
                            window.history.go(-2);
                        </script>

                <% }    
                }
                %>
