<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>後台管理</title>
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
        <!-- 引入自寫js -->
        <script src="../assets/js/loading.js"></script>
        <script src="../assets/js/backstage.js"></script>
    </head>
<body>
    <header>
        <div class="backstage-guide-container">
            <nav class="backstage-nav-header">
                <div class="backstage-home">
                    <a href="backstage.jsp">後台管理</a>
                </div>
                <div class="link-icon">
                    <div class="icon-backstage">
                        <a  href="backstage.jsp"><img src="../assets/img/google-icon/ic_home_white_36dp.png"></a>
                    </div>
                    <div class="icon-homepage">
                        <a  href="index.jsp" target="_blank"><img src="../assets/img/google-icon/ic_flip_to_front_white_36dp.png"></a>
                    </div>
                    <div class="icon-logout">
                        <a  href=""><img src="../assets/img/google-icon/ic_exit_to_app_white_36dp.png"></a>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>

            <div class="btn-add-pro-container">
                <a href="addPro.jsp"><button>新增商品</button></a>
            </div>

            <div class="pro-container">
                <div class="pro-table-title" id="pro-table-title">
                    <span>產品列表</span>
                </div>
                <div id="pro-table">
                    <table class="pro-table">
                        <thead>
                            <tr>
                                <th>
                                    <span>#</span>
                                </th>
                                <th>
                                    <span>產品品牌</span>
                                </th>
                                <th>
                                    <span>產品名稱</span>
                                </th>
                                <th>
                                    <span>存貨數量</span>
                                </th>
                                <th>
                                    <span>狀態</span>
                                </th>
                                <th>
                                    <span>動作</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 商品 -->
                            <%
                                                    
                            request.setCharacterEncoding("UTF-8");
                            response.setCharacterEncoding("UTF-8");   
                            int order1=0;
                            String sql2 = "SELECT `product_brand`, `product_name`, `product_amount`,`product_status` FROM `product_infor`";                            
                            ResultSet rs2 = con.createStatement().executeQuery(sql2);
                        
                            while(rs2.next()){
                                ++order1;
                                out.println("<tr>");
                                out.println("<td><span>"+ order1 +"</span></td>"); 
                                out.println("<td><span name='pro-brand'>"+rs2.getString("product_brand") +"</span></td>"); 
                                out.println("<td><span name='pro-name'>"+rs2.getString("product_name") +"</span></td>");
                                out.println("<td><span name='pro-inventory'>"+rs2.getString("product_amount")+"</span></td>");
                                if( rs2.getString("product_status").equals("1") ){
                                    out.println("<td><span  name='pro-status'>上架</span></td>");
                                }
                                else{
                                    out.println("<td><span  name='pro-status'>下架</span></td>");
                                }
                                out.println("<td><button name='switch'>下架</button></td>");
                                out.println("</tr>");
                                
                            } 
                            %>  
                        </tbody>
                    </table>
                </div>
            </div>
            
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
                        <input type="submit" name="k" value="查詢" />
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
                            String name = request.getParameter("filter-pro");
                            String start = request.getParameter("start");
                            String end = request.getParameter("end");
                            int order2 = 1;
                            String sql1="";
                            ResultSet rs1;

                                  

                                sql1 = "SELECT order_details.order_id,product_infor.product_name, order_details.product_id, order_details.order_time, ";
                                sql1 += "product_infor.product_price, order_details.howmuch, order_details.howmuch * product_infor.product_price ";
                                sql1 += "FROM `product_infor`, `order_details` ";
                                sql1 += "WHERE (order_details.product_id=product_infor.product_id) ORDER BY order_details.order_time";
                                //sql1 += "AND (order_details.product_id= '"+ name + "' ) AND ";
                                //sql1 += "(order_details.order_time BETWEEN '" + start + "' AND '" + end +"')  ORDER BY order_details.order_time" ;
                                
                                rs1 = con.createStatement().executeQuery(sql1);
                            
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
                        %>        
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>

    </footer>
</body>
</html>