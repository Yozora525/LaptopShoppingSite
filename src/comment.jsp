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
                    String comment = request.getParameter("memcomment");
                    String productid = request.getParameter("procID");
                    Integer stars=Integer.parseInt(request.getParameter("eval-star"));  
                    
                    String sqlac = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + accountmail + "'";
                    ResultSet rs1 = con.createStatement().executeQuery(sqlac);
                    rs1.next();
                    String id = rs1.getString("mem_id");

                    String sqli= "SELECT * FROM `comment` WHERE (`mem_id`='"+id+"') AND (`product_id`='"+ productid + "')";
                    ResultSet rsp = con.createStatement().executeQuery(sqli);
                    int c=0;
                    if( !rsp.next() ){
                        String sqld = "INSERT INTO `comment` VALUES ( '"+ id + "','"+ productid + "', '"+ comment + "', '"+ stars + "', '"+credate+"')";   
                        c = con.createStatement().executeUpdate(sqld);
                    }
                    else{
                        String sqlv = "UPDATE `comment` SET `mem_comment`='"+ comment+"', `star`="+ stars +", `comment_time`='"+ credate +"' WHERE `mem_id`='"+ id + "' AND `product_id`='"+ productid + "'";
                        c = con.createStatement().executeUpdate(sqlv);
                    }
                    
                    if ( c > 0 )
                        response.sendRedirect("proIntro.jsp?proID="+productid);
                    
                        
                    
            }
            %>
