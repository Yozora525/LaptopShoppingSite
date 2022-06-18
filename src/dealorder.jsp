<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 
<% 
    if(session.getAttribute("man_account")==null){
        response.sendRedirect("manage.jsp");
    } 
    else{
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>交易紀錄篩選</title>
    
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
                        <a  href="logout_man.jsp"><img src="../assets/img/google-icon/ic_exit_to_app_white_36dp.png"></a>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <div style="height: 50px;"></div>
    <div class="trans-data-container">
        <div class="trans-table-title" id="trans-table-title">
            <span>退貨請求</span>
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
                            <span>交易金額</span>
                        </th>
                        <th>
                            <span>確認退貨</span>
                        </th>
                    </tr>
                </thead>
                <tbody>
                <%
                    ResultSet rs5;
                    sql = "SELECT * FROM `orders`";
                    rs5 = con.createStatement().executeQuery(sql);
                    int order3=0;
                    while(rs5.next()){
                        if(rs5.getInt("rstatus")==1){
                            out.println("<tr>");
                            out.println("<td><span>"+ order3 +"</span></td>"); 
                            out.println("<td><span>"+ rs5.getString("order_id") +"</span></td>");
                            out.println("<td><span>"+ rs5.getInt("tprice")  +"</span></td>"); 
                            out.println("<td><span><a style='color:black' href='deleteorder.jsp?oid="+rs5.getString("order_id")+"'>確認退貨</a></span></td>");  
                            out.println("</tr>");
                            order3++;
                        }
                    }
                }   
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>