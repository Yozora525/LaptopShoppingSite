<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@include file = "catchDateRan.jsp" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>會員中心</title>
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
        <link rel="stylesheet" href="../assets/sass/member.css" />
        <link rel="stylesheet" href="../assets/sass/login.css" />
        <!-- 引入自寫js -->
        <script src="../assets/js/loading.js"></script>
        <script src="../assets/js/member.js"></script>
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
        if(session.getAttribute("mem_account") == null) {
           // response.sendRedirect("login.jsp");
        }
        
            // sql = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + mem_account + "'";
            sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='adsasddsa@gmail.com'";
            ResultSet rs = con.createStatement().executeQuery(sql);
            rs.next();
            String id = rs.getString("mem_id");
            
            out.println(id);
            sql = "SELECT `mem_name`,`mem_email`,`mem_phone`,`mem_birth` FROM `mem_infor` WHERE `mem_id` ='"+ id+"'";
            ResultSet rs1 = con.createStatement().executeQuery(sql);
            rs1.next();
            //http://localhost:8080/LaptopShoppingSite/src/memInfo.jsp
    %>
    
    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>
            
        </div>
        <div class="info">
            <div id="info-title" class="info-title">
                <span>基本資料</span>
            </div>
            <div class="info-container" id="">
                <div class="info-img-container">
                    <!-- 頭貼icon -->
                    <img src="../assets/img/icon/memcenter-mem2.png" />
                </div>
                <div class="info-content-container">
                    <form action="changeinfo.jsp" method="POST">
                        <div>
                            <span>姓名</span>
                            <% out.println("<input type='text' name='mname' class='' value='"+ rs1.getString("mem_name") +"' required/>");%>
                        </div>
                        <div>
                            <span>電子信箱</span>
                            <%out.println("<input type='email' name='memail' class='' value='"+ rs1.getString("mem_email") +"' readonly/>");%>
                        </div>
                        <div>
                            <span>手機號碼</span>
                            <%out.println("<input type='text' name='mphone' class='' value='"+ rs1.getString("mem_phone") +"' required/>");%>
                        </div>
                        <div>
                            <span>生日</span>
                            <%out.println("<input type='date' name='mbirth' class='' value='"+ rs1.getString("mem_birth") +"' required/>");%>
                        </div>
                        <div>
                            <button class="btn-change" >儲存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="change-pwd">
            <div id="change-pwd-title" class="change-pwd-title">
                <span>變更密碼</span>
            </div>
            <div class="change-pwd-container" id="">
                <form action="changeinfo.jsp" method="POST">
                    <div>
                        <span>目前密碼</span>
                        <input type="password" name="prepwd" class="" value="" required/>
                    </div>
                    <div>
                        <span>新密碼</span>
                        <input type="password" id="pwd" name="newpwd" class="" maxlength="16" value="" />
                        <label id="pwd-tip" class="tip"></label>
                    </div>
                    <div>
                        <span>確認新密碼</span>
                        <input type="password" id="check-pwd"  class="" maxlength="16" value="" />
                        <label id="check-pwd-tip" class="tip"></label>
                    </div>
                    <div>
                        <button class="btn-change" id="change-pwd">儲存</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="trans-data-container">
            <div id="trans-table-title" class="trans-table-title">
                <span>購買記錄</span>
            </div>
            <div  class="trans-table">
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
                                <span>總額</span>
                            </th>
                        </tr>
                        
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <span>  1</span>
                            </td>
                            <td>
                                <span name=""></span>
                            </td>
                            <td>
                                <span name="">2000-05-06</span>
                            </td>
                            <td>
                                <span name="">ASUS X515</span>
                            </td>
                            <td>
                                <span name="">$17900</span>
                            </td>
                            <td>
                                <span name="">1</span>
                            </td>
                            <td>
                                <span name="">$17900</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>  2</span>
                            </td>
                            <td>
                                <span name=""></span>
                            </td>
                            <td>
                                <span name="">2000-05-15</span>
                            </td>
                            <td>
                                <span name="">ACER Swift5</span>
                            </td>
                            <td>
                                <span name="">$29900</span>
                            </td>
                            <td>
                                <span name="">1</span>
                            </td>
                            <td>
                                <span name="">$29900</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
            
        <div class="trans-data-container">
            <div id="trans-table-title" class="trans-table-title">
                <span>評論記錄</span>
            </div>
            <div  class="trans-table">
                <table class="trans-table">
                    <thead>
                        <tr>
                            <th>
                                <span>#</span>
                            </th>
                            <th>
                                <span>留言日期</span>
                            </th>
                            <th>
                                <span>商品名稱</span>
                            </th>
                            <th>
                                <span>內容</span>
                            </th>
                            <th>
                                <span>評價</span>
                            </th>
                        </tr>
                        
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <span>1</span>
                            </td>
                            <td>
                                <span name="">2022-06-05</span>
                            </td>
                            <td>
                                <span name="">MacBook Air</span>
                            </td>
                            <td>
                                <span name="">good</span>
                            </td>
                            <td>
                                <span name="">4.0</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>2</span>
                            </td>
                            <td>
                                <span name="">2022-06-02</span>
                            </td>
                            <td>
                                <span name="">MacBook Air</span>
                            </td>
                            <td>
                                <span name="">goodgoodgood</span>
                            </td>
                            <td>
                                <span name="">5.0</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>

    </footer>
</body>
</html>