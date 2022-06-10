<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@include file = "catchDateRan.jsp" %> 

<%



                //抓前端輸入帳號密碼
                String logacc = request.getParameter("");
                String logpas = request.getParameter("");

                if( logacc.equals != "" && logpas.equals != "" ){
                    
                }
                //http://localhost:8080/LaptopShoppingSite/src/connectsql.jsp
                //抓前端輸入帳號密碼
                String regacc = request.getParameter(""); 
                String regpas = request.getParameter("");

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