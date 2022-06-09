<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>管理員登入</title>
        <!-- 引入jQuery -->
        <script src="../assets/js/lib/jquery/jquery.min.js"></script>
        <!-- 引入blockUI -->
        <script src="../assets/js/lib/blockUI/jquery.blockUI.js"></script>
        <script src="../assets/js/loading.js"></script>
        <!-- 引入login -->
        <script src="../assets/js/login.js"></script>
        <!-- 引入css -->
        <link rel="stylesheet" href="../assets/sass/common.css" />
        <link rel="stylesheet" href="../assets/sass/login.css" />
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
            <div class="container">
                <div class="login-register">
                    <span id="req-login">登入</span>
                </div>
                <!-- 登入介面 -->
                <div id="login-container" class="login-container">
                    <div class="login">
                        <input type="text" id="admin-acc" placeholder="帳號"  onkeyup="value=value.replace(/[^\w=@#\.\/\*]/ig,'')" /><br/>
                        <label id="login-acc-tip" class="tip"></label>
                    </div>
                    <div  class="login">
                        <input type="password" id="admin-pwd" placeholder="密碼" /><br/>
                        <label id="login-pwd-tip" class="tip"></label>
                    </div>
                    <div class="btn-login">
                        <button id="admin-login">登入</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>

</footer>
</body>
</html>