<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %> 
<%@include file = "connectsql.jsp" %> 

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
            <a href="manage.jsp" class="manage">網站管理</a>
        </div>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="index.jsp">首頁</a>
                </div>
                <div class="key-word-search">
                    <form method="GET" action="">
                        <input type="search" name="" placeholder="請輸入關鍵字">
                        <button style="background-color:transparent;border:0px"><img src="../assets/img/google-icon/ic_search_white_18dp.png"></button>
                    </form>
                </div>
                <div class="link-icon">
                    <div class="icon-login">
                        <a  href="login.jsp"><img src="../assets/img/google-icon/ic_account_circle_white_36dp.png"></a>
                    </div>
                    <div class="icon-contact">
                        <a  href=""><img src="../assets/img/google-icon/ic_group_white_36dp.png"></a>
                    </div>
                    <div class="icon-car">
                        <a  href="car.jsp"><img src="../assets/img/google-icon/ic_shopping_cart_white_36dp.png"></a>
                    </div>
                </div>
            </nav>
        </div>
    </header>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");    
    String pname = request.getParameter("");                                         // 量 填你傳過來的名字
    //String sql = "SELECT * FROM `product_infor` WHERE product_id='" + pname + "'"; //填完之後把這行註解拿掉
    sql = "SELECT * FROM `product_infor` WHERE (product_id='P001')";        //然後把這行刪掉
    ResultSet rs = con.createStatement().executeQuery(sql);
    sql = "SELECT * FROM `product_img` WHERE (product_id='P001')"; 
    ResultSet rs1 = con.createStatement().executeQuery(sql);

    %>

    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>
        </div>
        <% if(rs1.next()){ %>
        <div class="pro-container">
            <div class="pro-img-container">
                <div class="img-up">
                    <div class="img">
                        <img id="img-show" src="<%=rs1.getString("img_link")%>" />
                    </div>
                </div>
                <div class="img-down">
                    <div class="img-down-container">
                        <div>
                            <img name="img-list" src="<%=rs1.getString("img_link")%>" />
                        </div>
                        <div>
                            <img name="img-list" src="<%=rs1.getString("img_link_two")%>" />
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
             <%if(rs.next()){%>
            <div class="pro-info-container">
                <div class="pro-name">
                    <span><%=rs.getString("product_name")%></span>
                </div>
                <div class="pro-sold-quan">
                    <span><%=rs.getInt("product_sold")%></span> <!-- 從資料庫抓 -->
                    <span style="color: #bbb;">已賣出</span>
                </div>
                <div class="pro-price">
                    <span><%=rs.getInt("product_price")%></span>
                </div>
                <div class="pro-inventory">
                    <span>存貨：</span>
                    <span id="inventory"><%=rs.getInt("product_amount")%></span>
                </div>
                <%}%>
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

