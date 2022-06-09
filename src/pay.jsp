<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>付款</title>
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
        <link rel="stylesheet" href="../assets/sass/pay.css" />
        <!-- 引入自寫js -->
        <script src="../assets/js/loading.js"></script>
    </head>
<body>
    <header>
        <div style="text-align:right;background-color: #0096C7;">
        </div>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="index.html">首頁 | 結帳</a>
                </div>
            </nav>
        </div>
    </header>
    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>
            <div class="pay-container">
                <div class="pay-title-container">
                    <div class="pay-title-order">
                        <span style="color: #000;">訂單商品</span>
                    </div>
                    <div class="pay-title">
                        <span>單價</span>
                    </div>
                    <div class="pay-title">
                        <span>數量</span>
                    </div>
                    <div class="pay-title">
                        <span>總價</span>
                    </div>
                </div>
                <form action="" method="POST">
                    <!-- 訂單商品 -->
                    <div class="pay-item">
                        <div class="item-info-name">
                            <input class="" name="item-name" value="Apple MacBook Ari" readonly/>
                        </div>
                        <div class="item-info">
                            <input class="" name="item-price" value="38900" readonly/>
                        </div>
                        <div class="item-info">
                            <input class="" name="item-quan" value="1" readonly/>
                        </div>
                        <div class="item-info">
                            <input class=""name="item-revenue" value="38900" readonly/>
                        </div>
                    </div>


                    <div class="pay-checkout">
                        <div class="send-addr">
                            <input type="text" class="" name="addr" placeholder="請輸入宅配地址" />
                        </div>
                        <div class="pay-revenue">
                            <span>總金額：</span>
                            <span name="pay-revenue" style="color: #0096C7;font-weight: bold;">38900</span>
                        </div>
                        <div class="pay-btn-container">
                            <button id="btn-checkout">結帳</button>
                        </div>
                    </div>
                </form>
            </div>



        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>

    </footer>
</body>
</html>