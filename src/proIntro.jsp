<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>產品介紹</title>
    <!-- 引入jQuery -->
    <script src="../assets/js/lib/jquery/jquery.min.js"></script>
    <!-- 引入blockUI -->
    <script src="../assets/js/lib/blockUI/jquery.blockUI.js"></script>
    <!-- 引入自寫js -->
    <script src="../assets/js/loading.js"></script>
    <script src="../assets/js/product.js"></script>
    <!-- 引入css -->
    <link rel="stylesheet" href="../assets/sass/common.css" />
    <link rel="stylesheet" href="../assets/sass/proIntro.css" />
</head>
<body>
    <header>
        <div style="text-align:right;background-color: #0096C7;">
            <a href="manage.html" class="manage">網站管理</a>
        </div>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="index.html">首頁</a>
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
        </div>
        <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");    

            String sqlproduct = "SELECT `product_brand`, `product_name`, `product_price`, `product_amount`, `product_sold` FROM `product_infor` WHERE `product_status`=1";
            ResultSet rs = con.createStatement().executeQuery(sqlproduct);
                    out.println("<div class='product'>");
                    int k=1;
                                
                    while(rs.next()){
                                       
                    if (k%6!=0){
                     k++;
                    out.println("<div class='list'>");   
                    out.println("<img class='listimg' src='../assets/img/pro/"+rs.getString("product_brand")+"/"+rs.getString("product_name")+"_1.png'>");
                    out.println("<div class='protext'>");
                    out.println(rs.getString("product_name")+"<br>");
                    out.println("NT$"+rs.getInt("product_price"));                
                    out.println("</div>");  
                    out.println("</div>");
                    }else {
                    out.println("</div>");
                    out.println("<div class='product'>");
                    out.println("<div class='list'>");   
                    out.println("<img class='listimg' src='../assets/img/pro/"+rs.getString("product_brand")+"/"+rs.getString("product_name")+"_1.png'>");
                    out.println("<div class='protext'>");
                    out.println(rs.getString("product_name")+"<br>");
                    out.println("NT$"+rs.getInt("product_price"));                
                    out.println("</div>");  
                    out.println("</div>");
                    k=2;
                    }  
                    }
                     out.println("</div>");
            %>
        <div class="pro-container">
            <div class="pro-img-container">
                <div class="img-up">
                    <div class="img">
                        <%
                        out.println("<img id='img-show' src='../assets/img/pro/"+rs.getString("product_brand")+"/"+rs.getString("product_name")+"_1.png' />");
                        %>
                    </div>
                </div>
                <div class="img-down">
                    <div class="img-down-container">
                        <div>
                        <%
                        out.println("<img name='img-list' src='../assets/img/pro/"+rs.getString("product_brand")+"/"+rs.getString("product_name")+"_1.png' />");
                        %>
                        </div>
                        <div>
                        <%
                        out.println("<img name='img-list' src='../assets/img/pro/"+rs.getString("product_brand")+"/"+rs.getString("product_name")+"_2.png' />");
                        %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pro-info-container">
                <div class="pro-name">
                    <%
                        out.println("<span>"+rs.getString("product_name")+"</span>");
                    %>
                <div class="pro-sold-quan">
                    <%
                        out.println("<span>"+rs.getInt("product_sold")+"</span>");
                    %>
                    <span style="color: #bbb;">已賣出</span>
                </div>
                <div class="pro-price">
                    <%
                        out.println("<span>"+rs.getInt("product_price")+"</span>");
                    %>
                </div>
                <div class="pro-inventory">
                    <span>存貨：</span>
                    <%
                        out.println("<span id='inventory'>"+rs.getInt("product_amount")+"</span>");
                    %>
                </div>
                <div class="pro-quan">
                    <span>數量：</span>
                    <button id="minus">-</button>
                    <input type="text" id="quan" value="1" oninput = "value=value.replace(/[^\d]/g,'')" />
                    <button id="plus">+</button>
                </div>
                <div class="pro-btn-container">
                    <div>
                        <button id=""><img src="../assets/img/google-icon/ic_add_shopping_cart_white_18dp.png" />加到購物車</button>
                        <button id="">直接購買</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 商品介紹 -->
        <div class="pro-intro-container">
            <div class="pro-intro-title">
                <span>商品詳情</span>
            </div>
            <div class="pro-intro-content">
                <span>*搭載Intel® Core™ i5 處理器<br/>
                *NVIDIA® GeForce® MX330 獨立顯示卡<br/>
                *最高512GB SSD硬碟<br/>
                *83% 螢幕占比 15.6吋FHD螢幕</span>
            </div>
        </div>
        <!-- 商品評價 -->
        <div class="pro-eval-container">
            <div class="pro-intro-title">
                <span>商品評價</span>
            </div>
            <!-- 個別用戶評價 -->
            <div class="pro-eval">
                <div class="eval-user">
                    <span>使用者名稱</span>
                </div>
                <div class="eval-info">
                    <span class="eval-star">★</span>
                    <span class="eval-star">★</span>
                    <span class="eval-star">★</span>
                </div>
                <div class="eval-info">
                    <span>2022-06-03 21:07:57</span>
                </div>
                <div class="eval-content">
                    <span>評價內容</span>
                </div>
            </div>
            <div class="pro-eval">
                <div class="eval-user">
                    <span>使用者名稱</span>
                </div>
                <div class="eval-info">
                    <span class="eval-star">★</span>
                </div>
                <div class="eval-info">
                    <span>2022-06-03 21:07:57</span>
                </div>
                <div class="eval-content">
                    <span>評價內容</span>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>
    </footer>
</body>
</html>