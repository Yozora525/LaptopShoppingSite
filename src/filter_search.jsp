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
    <!-- 引入blockUI -->
    <script src="../assets/js/lib/blockUI/jquery.blockUI.js"></script>
    <!-- 引入css -->
    <link rel="stylesheet" href="../assets/sass/common.css" />
    <link rel="stylesheet" href="../assets/sass/index.css" />
    <!-- 引入自寫js -->
    <script src="../assets/js/loading.js"></script>
    <script src="../assets/js/index.js"></script>
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
                    <form method="GET" action="filter_search.jsp">
                        <input type="search" name="search_bar" placeholder="請輸入關鍵字">
                        <button style="background-color:transparent;border:0px">
                        <img src="../assets/img/google-icon/ic_search_white_18dp.png"></button>
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
            <!-- 產品 and 篩選 -->
            <div class="product-group">
                <!-- 篩選 -->          
                <div class="product-filter">
                    <form action="filter.jsp" method="GET" name="selectForm">
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
                                    <input type="checkbox" name="brand" value="APPLE" />
                                    <label>Apple</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="brand" value="MSI" />
                                    <label>MSI</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="brand" value="ASUS" />
                                    <label>ASUS</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="brand" value="ACER" />
                                    <label>ACER</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="brand" value="HP" />
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
                                    <input type="checkbox" name="size" value="A" />
                                    <label>13~15吋</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="size" value="B" />
                                    <label>15~17吋</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="size" value="C" />
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
                                    <input type="checkbox" name="type" value="電競" />
                                    <label>電競</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="type" value="商務" />
                                    <label>商務</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="type" value="創作設計" />
                                    <label>創作設計</label>
                                </div>
                                <div>
                                    <input type="checkbox" name="type" value="輕薄便攜" />
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
                                <input type="text" id="" name="minirange" class="input" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="$ 最小值">
                                <span>一</span>
                                <input type="text" id="" name="maxrange" class="input" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="$ 最大值">
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

                String search_bar = request.getParameter("search_bar");
                ResultSet sr;

                String sqlsr = "SELECT * FROM `product_infor` WHERE (`product_brand` LIKE '%" + search_bar + "%') OR (`product_type` LIKE '%" + search_bar + "%') OR (`product_size` LIKE '%" + search_bar + "%') OR (`product_discript` LIKE '%" + search_bar + "%') AND (`product_status`=1)";
                sr = con.createStatement().executeQuery(sqlsr);

                out.println("<div class='product'>");
                    int k=1;

                    while(sr.next()){
                     if (k%6!=0){
                     k++;
                    out.println("<div class='list'>");   
                    out.println("<div class='pro-img'>");
                    out.println("<a href='proIntro.jsp?proID="+sr.getString("product_id")+"'><img class='listimg' src='../assets/img/pro/"+sr.getString("product_brand")+"/"+sr.getString("product_name")+"_1.png'></a>");
                    out.println("</div>");  
                    out.println("<div class='pro-content'>");
                    out.println("<div class='protext'>");
                    out.println(sr.getString("product_name"));    
                    out.println("</div>"); 
                    out.println("<div class='pro-price'>");
                    out.println("$"+sr.getInt("product_price"));  
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    }else {
                    out.println("</div>");
                    out.println("<div class='product'>");
                    out.println("<div class='list'>");   
                    out.println("<div class='pro-img'>");
                    out.println("<a href='proIntro.jsp?proID="+sr.getString("product_id")+"'><img class='listimg' src='../assets/img/pro/"+sr.getString("product_brand")+"/"+sr.getString("product_name")+"_1.png'></a>");
                    out.println("</div>");  
                    out.println("<div class='pro-content'>");
                    out.println("<div class='protext'>");
                    out.println(sr.getString("product_name"));    
                    out.println("</div>"); 
                    out.println("<div class='pro-price'>");
                    out.println("$"+sr.getInt("product_price"));  
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    k=2;
                    }  
                    
                    }
                     out.println("</div>");                             
            %>
        </div>
    </main>
    <footer class="footer">
            <span class="copyright">&copy;</span>

    </footer>
</body>
</html>