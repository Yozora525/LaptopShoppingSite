<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>關於我們</title>
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
    <link rel="stylesheet" href="../assets/sass/about.css" />
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
    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>
        </div>
        <div class="about">
            <div class="about-list">
                <div class="about-list-img">
                    <img width="200px"  height="250px" src="../assets/img/about/10944207.jpg" class="pict"/>
                </div>
                <div class="about-list-word">
                    <div>游德裕</div>
                    <div>資管二乙</div>
                    <div>負責前端設計 網頁排版 美編</div><hr>
                    <div>要做完一個專案非常不容易，在這之中 遇到了一些挫折，但是透過大家互相合作之下，同心協力地完成了這麼大專案，從中也可以學到很多寶貴的經驗!!!</div>
                    <div>
                        <a href="https://www.facebook.com/Joseph11030"><img  height="50px" src="../assets/img/about/fb.jpg" class="pic"></a>
                        <a href="https://www.instagram.com/invites/contact/?i=16p6jxcxlr2ww&utm_content=tp9g6y"><img src="../assets/img/about/IG.jpg" class="pic"></a>  
                    </div>
                </div>   
            </div>
            <div class="about-list">
                <div class="about-list-img">
                    <img width="200px" height="250px" src="../assets/img/about/10944239.jpg" class="pict"/>         
                </div>
                <div class="about-list-word">
                    <div>李世彥</div>
                    <div>資管二乙</div>
                    <div>負責前端設計 網頁排版 美編 功能設計</div><hr>
                    <div>要做完一個專案非常不容易，在這之中 遇到了一些挫折，但是透過大家互相合作之下，同心協力地完成了這麼大專案，從中也可以學到很多寶貴的經驗!!!</div>
                    <div>
                        <a href="https://www.facebook.com/profile.php?id=100006760834143"><img height="50px" src="../assets/img/about/fb.jpg" class="pic"></a>
                        <a href="https://www.instagram.com/accounts/login/?next=/yozora_52425/"><img src="../assets/img/about/IG.jpg" class="pic"></a>
                    </div>
                </div>
            </div>
            <div class="about-list">
                <div class="about-list-img">
                    <img width="200px"  height="250px" src="../assets/img/about/10944199.jpg" class="pict"/>
                </div>
                <div class="about-list-word">
                    <div>吳岱芸</div>
                    <div>資管二甲</div>
                    <div>負責後端功能設計 資料庫彙整</div><hr>
                    <div>要做完一個專案非常不容易，在這之中 遇到了一些挫折，但是透過大家互相合作之下，同心協力地完成了這麼大專案，從中也可以學到很多寶貴的經驗!!!</div>
                    <div>
                        <a href="https://www.facebook.com/profile.php?id=100006591555918"><img  height="50px" src="../assets/img/about/fb.jpg" class="pic"></a>
                        <a href="https://www.instagram.com/"><img src="../assets/img/about/IG.jpg" class="pic"></a>
                    </div>
                </div>
            </div>
            <div class="about-list">
                <div class="about-list-img">
                    <img width="200px" height="250px" src="../assets/img/about/10944188.jpg" class="pict"/>       
                </div>
                <div class="about-list-word">
                    <div>張鈞量</div>
                    <div>資管二甲</div>
                    <div>負責後端功能設計 資料庫彙整</div><hr>
                    <div>要做完一個專案非常不容易，在這之中 遇到了一些挫折，但是透過大家互相合作之下，同心協力地完成了這麼大專案，從中也可以學到很多寶貴的經驗!!!</div>
                    <div>
                        <a href="https://www.facebook.com/profile.php?id=100004686072711"><img height="50px" src="../assets/img/about/fb.jpg" class="pic"></a>
                        <a href="https://www.instagram.com/accounts/login/?next=/davidchang496"><img src="../assets/img/about/IG.jpg" class="pic"></a>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">Copyright © 2022 多比店舖 Inc. All Rights Reserved.</span>
    </footer>
</body>
</html>