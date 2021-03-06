<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>後台管理</title>
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
        <!-- 引入自寫js -->
        <script src="../assets/js/loading.js"></script>
        <script src="../assets/js/backstage.js"></script>
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
    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>
        <form action="addCommo.jsp" method="POST">
            <div class="add-pro-container">
                <table class="add-pro-table">
                    <tr>
                        <td>
                            產品名稱：
                        </td>
                        <td>
                            <input type="text" id="add-pro-name" name="name"  placeholder="請輸入產品名稱" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            品牌：
                        </td>
                        <td>
                            <input type="text" id="add-pro-brand" name="brand" placeholder="請輸入品牌" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            螢幕尺寸：
                        </td>
                        <td>
                            <input type="text" id="add-pro-size" name="size" placeholder="請輸入螢幕尺寸"  oninput = "value=value.replace(/[^\d\.]/g,'')"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有無觸控功能：
                        </td>
                        <td>
                            <input type="radio" name="add-pro-touch" value="1" />
                            <label>有</label>
                            <input type="radio" name="add-pro-touch" value="0" checked/>
                            <label>無</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            選擇產品類型：
                        </td>
                        <td>
                            <select id="add-pro-type" name="type" >
                                <%  
                                    sql = "SELECT `product_type` FROM `type_list`";
                                    ResultSet rs=con.createStatement().executeQuery(sql);
                                    while(rs.next()){
                                        out.println("<option value='"+rs.getString("product_type")+"'> "+ rs.getString("product_type")+"</option>");
                                    }
                                %>
                                <option value='其他'>其他</option>;
                            </select><br>
                            <input type="text" id="add-pro-type" placeholder="選擇其他再輸入欲新增類別" name="type1"   />

                        </td>
                    </tr>
                    <tr>
                        <td>
                            庫存數量：
                        </td>
                        <td>
                            <input type="text" id="add-pro-inventory" placeholder="請輸入存貨數量" name="store"  oninput = "value=value.replace(/[^\d\.]/g,'')"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            單價：
                        </td>
                        <td>
                            <input type="text" id="add-pro-price" placeholder="請輸入產品單價" name="price" oninput = "value=value.replace(/[^\d\.]/g,'')"  />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            產品敘述：
                        </td>
                        <td>
                            <input type="text" id="discript" placeholder="請輸入產品描述" name="discript"  />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button id="add-pro">新增產品</button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">Copyright © 2022 多比店舖 Inc. All Rights Reserved.</span>
    </footer>
</body>
</html>