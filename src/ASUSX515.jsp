<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 引入jQuery -->
    <script src="../assets/js/lib/jquery/jquery.min.js"></script>
    <!-- 引入Echarts -->
    <script src="../assets/js/lib/echarts/echarts.min.js"></script>
    <!-- 引入jQuery-Confirm -->
    <script src="../assets/js/lib/jquery-confirm/jquery-confirm.min.js"></script>
    <link rel="stylesheet" href="../assets/js/lib/jquery-confirm/jquery-confirm.min.css" />
    <!-- 引入slick -->
    <script src="../assets/js/lib/slick/slick.min.js"></script>
    <link rel="stylesheet" href="../assets/js/lib/slick/slick-theme.css" />
    <link rel="stylesheet" href="../assets/js/lib/slick/slick.css" />
    <!-- 引入blockUI -->
    <script src="../assets/js/lib/blockUI/jquery.blockUI.js"></script>
    <script src="../assets/js/loading.js"></script>
    <!-- 引入css -->
    <link rel="stylesheet" href="../assets/sass/common.css" />
    <style>
        @import url("../assets/sass/product.css");
        @import url("../assets/sass/ASUSX515.css");
    </style>
</head>
<body>
    <header>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="">首頁</a>
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
        <div class="LAP">
            <div class="L-INFO">
                <div class="L-I-IMG">
                    <div class="L-I-IMG-1">
                    <%out.println("<img style='width:200px;' src= '" + rs.getString("img_link") + "'  /> "); %>
                    </div>
                    <div class="L-I-IMG-IN">
                        <img width="100px"  src="../assets/img/pro/ASUS/ASUS X515_1.png" /> 
                        <img width="100px"  src="../assets/img/pro/ASUS/ASUS X515_2.png" />
                    </div>
                </div>
        <%}%>
                <div class="L-I-CONTENT">
                    <%if(rs.next()){%>
                    <h1><%=rs.getString("product_name")%></h1><hr style="width: 80%;"><br>
                    <h3>NT$<%=rs.getInt("product_price")%></h3><br>
                    <h3>存貨數量:<%=rs.getInt("product_amount")%></h3><br>
                    <div class="buy">
                        <h3>購買數量:</h3> 
                        <input onkeyup="value=value.replace(/[^\d]/g,'') " type="number" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"  min="1" max="10" value="1" class="input">
                        <div class="car">
                            <img src="../assets/img/google-icon/car+.png" class="car+">
                            加入購物車
                        </div>
                        <div class="car">立即購買</div>
                    </div>                                    
                </div>
            </div>  
        </div>
        <h1 style="text-align: center;padding-top:3%;">商品細節</h1>
        <div class="LAPDETAIL">
            <div class="L-INFO" style="text-align: center;">
                <div class="L-I-DETAIL">     
                    <h3>搭載Intel® Core™ i5 處理器</h3><br>
                    <h3>NVIDIA® GeForce® MX330 獨立顯示卡</h3><br>
                    <h3>最高512GB SSD硬碟</h3><br>
                    <h3>83% 螢幕占比 15.6吋FHD螢幕</h3><br>
                </div>
            </div>  
        </div>
        <%}%>
        <h1 style="text-align: center ;padding-top:3%;">商品評論</h1>
        <div class="COMMENTLIST">
            <div class="COMMENT">
                王曉明:<br>
                這個筆電便宜又好用
            </div>
            <div class="COMMENT">
                陳大華:<br>
                買到他根本賺到阿 雖然是文書機 但是整體性能超棒的
            </div>
            <div class="COMMENT">
                王曉明:<br>
                身為小資的我 這一款筆電相當適合需求不高的族群
            </div>
        </div>
        <h1 style="text-align: center ;padding-top:2%;">輸入評論</h1>
        <div class="WORD">
            <div class="textarea">
                <textarea name="COMMENT" cols="185" rows="10" wrap="hard"></textarea>
            </div>
            <div class="submit">
               送出
            </div>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>
    </footer>
</body>
</html>