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
                <div class="home">
                    <a href="index.jsp">多比店舖</a>
                </div>
               <div class="key-word-search">
                    <form method="POST" action="filter_search.jsp">
                        <input type="search" name="searchbar" placeholder="請輸入關鍵字">
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
    <%
        if(session.getAttribute("mem_account") == null || session.getAttribute("mem_account").equals("")) {
           response.sendRedirect("login.jsp");
        }
        else{
            String acc = session.getAttribute("mem_account").toString();
            sql = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + acc + "'";
            //sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='adsasddsa@gmail.com'";
            ResultSet rs = con.createStatement().executeQuery(sql);
            rs.next();
            String id = rs.getString("mem_id");
            
            
            sql = "SELECT `mem_name`,`mem_email`,`mem_phone`,`mem_birth` FROM `mem_infor` WHERE `mem_id` ='"+ id +"'";
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
                            <%  if(rs1.getString("mem_birth").equals("0000-00-00")){
                                    out.println("<input type='date' name='mbirth' class='' value='"+ rs1.getString("mem_birth") +"' required/>");
                                }
                                else{
                                    out.println("<input type='date' name='mbirth' class='' value='"+ rs1.getString("mem_birth") +"' disabled='disabled' required/>");
                                }
                            %>
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
                <form action="changepwd.jsp" method="POST">
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
                                <span>退貨</span>
                            </th>
                        </tr>
                        
                    </thead>
                    <tbody>
                    <%
                        sql = "SELECT * FROM `orders` WHERE `mem_id`='"+id+"'";
                        ResultSet rs4 = con.createStatement().executeQuery(sql);
                        int i = 0;
                        String oid, ot;
                        while(rs4.next()){
                            i++;
                            oid = rs4.getString("order_id");
                            sql = "SELECT `order_time` FROM `order_details` WHERE `order_id`=?";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ps.setString(1,oid);
                            ResultSet rs5 =ps.executeQuery();
                            rs5.next();
                            ot = rs5.getString("order_time");
                            out.println("<tr><td><span>"+i+"</span></td>");
                            out.println("<td><span name=''><a href='orderdetail.jsp?oid="+oid+"' style='text-decoration: none;color: #000;'>"+oid+"</a></span></td>");
                            out.println("<td><span name=''>"+ot+"</span></td>");
                            //按鈕改在下面這行的out.println
                            out.println("<td><span name=''><a href='deleteorder.jsp?"+oid+"'>退貨</a></span></td></tr>");
                        }
                    %>
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
                        <%
                        sql = "SELECT * FROM `comment`, `product_infor` WHERE `mem_id`='"+id+"' AND (comment.product_id=product_infor.product_id) ORDER BY `comment_time` ASC ";
                        ResultSet rs5 = con.createStatement().executeQuery(sql);
                        int c = 0;

                        while(rs5.next()){
                            c++;
                                       
                            out.println("<tr>");
                            out.println("<td>");
                            out.println("<span>"+c+"</span>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<span name=''>"+rs5.getString("comment_time")+"</span>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<span name=''>"+rs5.getString("product_name")+"</span>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<span name=''>"+rs5.getString("mem_comment")+"</span>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<span name=''>"+rs5.getInt("star")+"</span>");
                            out.println("</td>");
                            out.println("</tr>");
                        }
                        }
                        %>   
                    </tbody>
                </table>
            </div>
        </div>
        
    </main>
    <footer class="footer">
        <span class="copyright">Copyright © 2022 多比店舖 Inc. All Rights Reserved.</span>
    </footer>
</body>
</html>