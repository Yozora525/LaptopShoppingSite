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
        <!-- 引入自寫js -->
        <script src="../assets/js/loading.js"></script>
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
                    <form action="" method="POST">
                        <div>
                            <span>姓名</span>
                            <input type="text" class="" value="" required/>
                        </div>
                        <div>
                            <span>電子信箱</span>
                            <input type="email" class="" value="" required/>
                        </div>
                        <div>
                            <span>手機號碼</span>
                            <input type="text" class="" value="" required/>
                        </div>
                        <div>
                            <span>生日</span>
                            <input type="date" class="" value="" required/>
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
                <div>
                    <span>目前密碼</span>
                    <input type="password" class="" value="" />
                </div>
                <div>
                    <span>新密碼</span>
                    <input type="password" class="" value="" />
                </div>
                <div>
                    <span>確認新密碼</span>
                    <input type="password" class="" value="" />
                </div>
                <div>
                    <button class="btn-change" >儲存</button>
                </div>
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