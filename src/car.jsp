<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>購物車</title>
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
        <link rel="stylesheet" href="../assets/sass/car.css" />
        <!-- 引入自寫js -->
        <script src="../assets/js/loading.js"></script>
        <script src="../assets/js/car.js"></script>
    </head>
<body>
    <header>
        <div style="text-align:right;background-color: #0096C7;">
            <a href="manage.html" class="manage">網站管理</a>
        </div>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="index.html">首頁 | 購物車</a>
                </div>
                <div class="key-word-search">
                    <form method="GET" action="">
                        <input type="search" name="" placeholder="請輸入關鍵字">
                        <button style="background-color:transparent;border:0px"><img src="../assets/img/google-icon/ic_search_white_18dp.png"></button>
                    </form>
                </div>
                <div class="link-icon">
                    <div class="icon-login">
                        <a  href="login.html"><img src="../assets/img/google-icon/ic_account_circle_white_36dp.png"></a>
                    </div>
                    <div class="icon-contact">
                        <a  href=""><img src="../assets/img/google-icon/ic_group_white_36dp.png"></a>
                    </div>
                    <div class="icon-car">
                        <a  href="car.html"><img src="../assets/img/google-icon/ic_shopping_cart_white_36dp.png"></a>
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
            <!-- 購物車列表 -->
            <div class="car-container">
                <div class="car-title-container">
                    <div class="car-title-checkbox">
                        <input type="checkbox" class="" id="all-check"/>
                    </div>
                    <div class="car-title-item">
                        <span class="">商品</span>
                    </div>
                    <div class="car-title">
                        <span class="">單價</span>
                    </div>
                    <div class="car-title">
                        <span class="">數量</span>
                    </div>
                    <div class="car-title">
                        <span class="">總計</span>
                    </div>
                    <div class="car-title">
                        <span class="">操作</span>
                    </div>
                </div>
                <form action="" method="POST" id="" class="">
                    <!-- 購物車內商品 -->
                    <%
                        request.setCharacterEncoding("UTF-8");
                        response.setCharacterEncoding("UTF-8");
                        sql = "SELECT cart.mem_id, product_infor.product_name, cart.product_id , product_infor.product_price , cart.order_amount, product_infor.product_price * cart.order_amount";
                        sql += " FROM `cart`, `product_infor`";
                        sql += "WHERE (cart.mem_id = 'MEM20220531100430002') AND (cart.product_id = product_infor.product_id)";
                       // out.println(sql);
                        ResultSet rs = con.createStatement().executeQuery(sql);

                        while(rs.next()){
                            out.println("<div class='car-item' name='car-item'>");
                            out.println("<div class='car-item-checkbox'>");
                            out.println("<div class='item-checkbox'>");
                            out.println("<input type='checkbox' name='item-check' />");
                            out.println("</div>");
                            out.println("<div class='item-name'>");
                            out.println("<input type='text' name='item-name' value='"+ rs.getString("product_infor.product_name") +"' readonly/>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("<div class='car-item-other'>");
                            out.println("<div class='car-item-price'>");
                            out.println("<input type='text' class='item-price' name='item-price' value='"+ rs.getInt("product_infor.product_price") +"' readonly/>");
                            out.println("</div>");
                            out.println("<div class='car-item-quan'>");
                            out.println("<div class='item-quan'>");
                            
                            out.println("<input type='number' name='item-quan' value='"+rs.getString("cart.order_amount")+"' min='1' max='' oninput =' value=value.replace(/[^&#92;d]/g,'') ' /> ");
                            
                            out.println("</div>");
                            out.println("</div>");
                            out.println("<div class='car-item-sum'>");
                            out.println("<span class='item-sum' name='item-sum'>"+ rs.getInt("product_infor.product_price * cart.order_amount") +"</span>");
                            out.println("</div>");
                            out.println("<div class='car-item-delete'>");
                            out.println("<span class='item-delete' name='item-delete'>刪除</span>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                            
                        }
                    %> 

                    
                    <div class="car-pay">
                        <div class="total-container">
                        <%-- <%
                            sql = "SELECT cart.mem_id, product_infor.product_name, cart.product_id , product_infor.product_price , cart.order_amount, SUM(product_infor.product_price * cart.order_amount) AS totalprice";
                            sql += " FROM `cart`, `product_infor`";
                            sql += "WHERE (cart.mem_id = 'MEM20220531100430002') AND (cart.product_id = product_infor.product_id)";
                       
                             rs = con.createStatement().executeQuery(sql);
                        %> --%>
                        
                            <span class=""> 總金額:</span>
                            <span class="" id="car-pay-total" style="color: #0096C7;font-weight: bold;">0</span>
                        </div> 
                        <%-- <%if(rs.next()){%><%=rs.getString(6)%><%}%> --%>
                        
                        <div class="car-par-btn">
                            <button type="submit" class="">去買單</button>
                        </div>
                    </div>
                </form>
            </div>
            
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>

    </footer>
</body>
</html>