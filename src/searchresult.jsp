<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>交易紀錄篩選</title>
    
        <!-- 引入jQuery -->
        <script src="../assets/js/lib/jquery/jquery.min.js"></script>
        <!-- 引入Echarts -->
        <script src="../assets/js/lib/echarts/echarts.min.js"></script>
        <!-- 引入jQuery-Confirm -->
        <script src="../assets/js/lib/jquery-confirm/jquery-confirm.min.js"></script>
        <link rel="stylesheet" href="../assets/js/lib/jquery-confirm/jquery-confirm.min.css" />
        <!-- 引入blockUI -->
        <script src="../assets/js/lib/blockUI/jquery.blockUI.js"></script>
        <!-- 引入login -->
        <script src="../assets/js/login.js"></script>
        <!-- 引入css -->
        <link rel="stylesheet" href="../assets/sass/common.css" />
        <link rel="stylesheet" href="../assets/sass/backstage.css" />
</head>
<body>
    <header>
        <div style="text-align:right;background-color: #0096C7;">
        <%
                if(session.getAttribute("mem_account")==null||session.getAttribute("mem_account").equals("")){
                    out.println("<a href='manage.jsp' class='manage'>網站管理</a>");
                }
                else{
                    out.println("<a href='logout_mem.jsp' class='manage'>登出</a>");
                }
            %>
        </div>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="index.jsp">多比店舖</a>
                </div>
                <div class="key-word-search">
                    <form method="GET" action="filter_search.jsp">
                        <input type="search" name="" placeholder="請輸入關鍵字">
                        <button style="background-color:transparent;border:0px"><img src="../assets/img/google-icon/ic_search_white_18dp.png"></button>
                    </form>
                </div>
                <div class="link-icon">
                    <%  String lurl;
                        if(session.getAttribute("mem_account")==null||session.getAttribute("mem_account").equals("")){
                            lurl = "login.jsp";
                        }
                        else{
                            lurl = "memInfo.jsp";
                        }
                    %>
                    <div class="icon-login">
                        <a  href="<%=lurl%>"><img src="../assets/img/google-icon/ic_account_circle_white_36dp.png"></a>
                    </div>
                    <div class="icon-contact">
                        <a  href="about.jsp"><img src="../assets/img/google-icon/ic_group_white_36dp.png"></a>
                    </div>
                    <div class="icon-car">
                        <a  href="car.jsp"><img src="../assets/img/google-icon/ic_shopping_cart_white_36dp.png"></a>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <div style="height: 50px;"></div>
    <div class="trans-data-container">
        <div class="trans-table-title" id="trans-table-title">
            <span>交易紀錄列表</span>
        </div>
        <div class="trans-filter" id="trans-filter">
            
            <form action="searchresult.jsp" method="GET">
                產品名稱:
                <select name="filter-pro">
                    <option value=''>--請選擇--</option>
                <%  
                    
                    sql = "SELECT `product_id`,`product_name` FROM `product_infor`";
                    ResultSet rs=con.createStatement().executeQuery(sql);
                    while(rs.next()){
                        out.println("<option value='"+rs.getString("product_id")+"'> "+ rs.getString("product_name")+"</option>");
                    }
                       
                %>
                </select>
                起:<input type="date" name="start" required/>
                迄:<input type="date" name="end" required/>
                <input type="submit" value="查詢" />
            <a href="backstage.jsp">回後台首頁</a>
            </form>
        </div>
        <div id="trans-table">
            <table class="trans-table">
                <thead>
                    <tr>
                        <th>
                            <span>#</span>
                        </th>
                        <th>
                            <span>訂單編號</span>
                        </th>
                        <th>
                            <span>交易日期</span>
                        </th>
                        <th>
                            <span>商品名稱</span>
                        </th>
                        <th>
                            <span>單價</span>
                        </th>
                        <th>
                            <span>數量</span>
                        </th>
                        <th>
                            <span>金額</span>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        request.setCharacterEncoding("UTF-8");
                        response.setCharacterEncoding("UTF-8");
                           
                        String name = request.getParameter("filter-pro");
                        String start = request.getParameter("start");
                        String end = request.getParameter("end");
                        int order2=1;
                        String sql1;
                        if( name.equals("") | name == null ){
                            sql1 = "SELECT order_details.order_id,product_infor.product_name, order_details.product_id, order_details.order_time, ";
                            sql1 += "product_infor.product_price, order_details.howmuch, order_details.howmuch * product_infor.product_price ";
                            sql1 += "FROM `product_infor`, `order_details` ";
                            sql1 += "WHERE (order_details.product_id=product_infor.product_id) AND ";
                            sql1 += "(order_details.order_time BETWEEN '" + start + "' AND '" + end +"')  ORDER BY order_details.order_time" ;
                            
                            ResultSet rs1 = con.createStatement().executeQuery(sql1);
                        
                            while(rs1.next()){
                                out.println("<tr>");
                                out.println("<td><span>"+ order2 +"</span></td>"); 
                                out.println("<td><span>"+rs1.getString("order_details.order_id") +"</span></td>"); 
                                out.println("<td><span>"+rs1.getString("order_details.order_time") +"</span></td>");
                                out.println("<td><span>"+rs1.getString("product_infor.product_name") +"</span></td>");
                                out.println("<td><span>"+rs1.getInt("product_infor.product_price") +"</span></td>");
                                out.println("<td><span>"+rs1.getInt("order_details.howmuch")+ "</span></td>");
                                out.println("<td><span>"+rs1.getInt("order_details.howmuch * product_infor.product_price") +"</span></td>");
                                out.println("</tr>");
                                order2++;
                            } 
                        }
                        else{
                            sql1 = "SELECT order_details.order_id,product_infor.product_name, order_details.product_id, order_details.order_time, ";
                            sql1 += "product_infor.product_price, order_details.howmuch, order_details.howmuch * product_infor.product_price ";
                            sql1 += "FROM `product_infor`, `order_details` ";
                            sql1 += "WHERE (order_details.product_id=product_infor.product_id) ";
                            sql1 += "AND (order_details.product_id= '"+ name + "' ) AND ";
                            sql1 += "(order_details.order_time BETWEEN '" + start + "' AND '" + end +"')  ORDER BY order_details.order_time" ;
                            
                            ResultSet rs1 = con.createStatement().executeQuery(sql1);
                        
                            while(rs1.next()){
                                out.println("<tr>");
                                out.println("<td><span>"+ order2 +"</span></td>"); 
                                out.println("<td><span>"+rs1.getString("order_details.order_id") +"</span></td>"); 
                                out.println("<td><span>"+rs1.getString("order_details.order_time") +"</span></td>");
                                out.println("<td><span>"+rs1.getString("product_infor.product_name") +"</span></td>");
                                out.println("<td><span>"+rs1.getInt("product_infor.product_price") +"</span></td>");
                                out.println("<td><span>"+rs1.getInt("order_details.howmuch")+ "</span></td>");
                                out.println("<td><span>"+rs1.getInt("order_details.howmuch * product_infor.product_price") +"</span></td>");
                                out.println("</tr>");
                                order2++;
                            } 
                        }
                        
                    %>                            
                
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>