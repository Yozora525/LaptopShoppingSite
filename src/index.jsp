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
    <title>首頁</title>
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
    <!-- 引入css -->
    <link rel="stylesheet" href="../assets/sass/common.css" />
    <link rel="stylesheet" href="../assets/sass/index.css" />
    <!-- 引入自寫js -->
    <script src="../assets/js/loading.js"></script>
    <script src="../assets/js/slick.js"></script>
    <script src="../assets/js/index.js"></script>
    <!-- <style>
        @import url("../assets/sass/product.css");
    </style> -->
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
            <!-- 輪播套件 -->
            <div class="slick-container" style="width:100%;">
                <div class="content_format">
                    <div class="slick">
                        <!-- 要輪播的內容 -->
                        <div>1</div>
                        <div>2</div>
                        <div>3</div>
                    </div>
                </div>
            </div>
            <h1 style="text-align: center;">熱銷商品</h1>
            <div class="prohot">
                <div class="prohotlist">
                    <img width="300px" class="prohot-img" src="../assets/img/pro/ACER/ACER Aspire5 A514-54G-58HW_1.png" />
                    <div class="prohottext">
                        No1.ACER Aspire5 A514-54G-58HW
                    </div>
                </div>
                <div class="prohotlist">
                    <img width="300px" class="prohot-img" src="../assets/img/pro/ASUS/ASUS TUF Gaming F15_1.png"/>
                    <div class="prohottext">
                        No2.ASUS TUF Gaming F15
                    </div>
                    
                </div>
                <div class="prohotlist">
                    <img width="300px" class="prohot-img" src="../assets/img/pro/ASUS/ASUS Zenbook 14 Flip OLED_1.png" />
                    <div class="prohottext">
                        No3.ASUS Zenbook 14 Flip OLED
                    </div>  
                </div>
            </div>
            
            <!-- 產品 and 篩選 -->
            <div class="product-group">
                <!-- 篩選 -->
                
                <div class="product-filter">
                    <form action="" method="GET" id="" name="">
                    <div id="filter-slide" class="" style="text-align:center;">
                        <span class="">篩選</span>
                    </div>
                    <div id="filter" class="filter">

                        <div class="filter-container">
                            <!-- 品牌 -->
                            <div class="filter-type">
                                <span>品牌</span>
                            </div>
                            <div class="filter-item">
                                <!-- checkBox -->
                                <div>
                                    <input type="checkbox" name="" value="APPLE" />
                                    <label>Apple</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="MSI" />
                                    <label>MSI</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="ASUS" />
                                    <label>ASUS</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="ACER" />
                                    <label>ACER</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="HP" />
                                    <label>HP</label>
                                </div>
                            </div>
                        </div>
                        <div class="filter-container">
                            <!-- 螢幕尺寸 -->
                            <div class="filter-type">
                                <span>螢幕尺寸</span>
                            </div>
                            <div class="filter-item">
                                <!-- checkBox -->
                                <div>
                                    <input type="checkbox" name="" value="" />
                                    <label>13~15吋</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="" />
                                    <label>15~17吋</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="" />
                                    <label>17吋以上</label>
                                </div>
                            </div>
                        </div>
                        <div class="filter-container">
                            <!-- 使用類型 -->
                            <div class="filter-type">
                                <span>使用類型</span>
                            </div>
                            <div class="filter-item">
                                <!-- checkBox -->
                                <div>
                                    <input type="checkbox" name="" value="電競" />
                                    <label>輕薄便攜</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="商務" />
                                    <label>商務</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="創作設計" />
                                    <label>創作設計</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="" value="輕薄便攜" />
                                    <label>輕薄便攜</label>
                                </div>
                                
                            </div>
                        </div>
                        <div class="filter-container">
                            <!-- 價格範圍 -->
                            <div class="filter-type">
                                <span>價格範圍</span>
                            </div>
                            <div class="filter-item">
                                <!-- text -->
                                <input type="text" id="" name="" class="input" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="$ 最小值">
                                <span>一</span>
                                <input type="text" id="" name="" class="input" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="$ 最大值">
                            </div>
                        </div>
                        <button class="btn-filter" id="btn-filter">查詢</button>
                        </form>
                    </div>
                </div>

                <!-- 產品列表 -->
                <div class="product-list">
             
             <%
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");    

                    String sql2 = "SELECT `product_brand`, `product_name`, `product_price` FROM `product_infor` WHERE `product_status`=1";
                    ResultSet rs = con.createStatement().executeQuery(sql2);
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
             
            
                </div>
                    
        </div>
    </main>
    <footer class="footer">
            <span class="copyright">&copy;</span>

    </footer>
</body>
</html>

