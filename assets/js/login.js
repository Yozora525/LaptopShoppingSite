
$(function(){
    $('#req-register').on('click', function(event){
        $('#register-container').show();
        $('#login-container').hide();
    });

    $('#req-login').on('click', function(event){
        $('#login-container').show();
        $('#register-container').hide();
    });

    $('#login').on('click', function(event){
        let acc = $('#acc').val();
        let pwd = $('#pwd').val();

        if(acc.length == 0){
            $('#login-acc-tip').html('請輸入帳號');
            return;
        }else{
            $('#login-acc-tip').html('');
        }

        if(pwd.length == 0){
            $('#login-pwd-tip').html('請輸入密碼');
            return;
        }else{
            $('#login-pwd-tip').html('');
        }


        $.ajax({
            // ex:/專案名/資料夾名/檔案名
            url: "/",
            type: "POST",
            dataType: 'json',
            data: {'acc':acc,'pwd':pwd},
            success: function(data) {
                if(data['res']=='success'){
                    alert('登入成功');
                    window.location.replace('LaptopShoppingSiteFront/templates/index.html'); //跳轉頁面
                }
                else{
                    alert(data['msg']);
                }
            },
            error: function(jqXHR) {
                alert(jqXHR.statusText);
                alert(jqXHR.responseText);
            }
        });
    });

    $('#register').on('click',function(event){
        let acc = $('#reg-acc').val();
        let pwd = $('#reg-pwd').val();
        let reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
        let check_pwd = $('#check-pwd').val();

        if(acc.length == 0) {
            $('#acc-tip').html('請輸入電子信箱');
            return;
        }else if(acc.indexOf('@') == -1){
            $('#acc-tip').html('電子信箱格式不正確');
            return
        }else{
            $('#acc-tip').html('');
        }

        if (reg.test(pwd)) {
            $('#pwd-tip').html('');
        }else{
            $('#pwd-tip').html('密碼長度須為8-16，大小寫英數混合');
            return;
        }
        
        if(pwd != check_pwd){
            $('#check-pwd-tip').html('兩次密碼輸入不一致');
            return;
        }else if(pwd.length == 0) {
            $('#pwd-tip').html('請輸入密碼');
            return;
        }else{
            $('#pwd-tip').html('');
            $('#check-pwd-tip').html('');
        }
        
        
        $.ajax({
            // ex:/專案名/資料夾名/檔案名
            url: "/",
            type: "POST",
            // dataType: 'json',
            data: {'acc':acc,'pwd':pwd},
            // 告訴jQuery不要去處理髮送的資料
            processData : false, 
            // 告訴jQuery不要去設定Content-Type請求頭
            contentType : false,
            success: function(data) {
                if(data['res']=='success'){
                    alert('註冊成功');
                    window.location.replace('/LaptopShoppingSiteFront/templates/index.html'); //跳轉頁面
                    // location.reload();
                }
                else{
                    alert(data['msg']);
                }
            },
            error: function(jqXHR) {
                alert(jqXHR.statusText);
                alert(jqXHR.responseText);
            }
        });
    });


    $('#reg-pwd').on('keyup', function(event){
        let pwd = $(this).val();
        let reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;

        if (reg.test(pwd)) {
            $('#pwd-tip').html('');
        }else{
            $('#pwd-tip').html('密碼長度須為8-16，大小寫英數混合');
        }
    });

    $('#check-pwd').on('keyup', function(event){
        let pwd = $('#reg-pwd').val();
        let check_pwd = $(this).val();

        if(pwd != check_pwd){
            $('#check-pwd-tip').html('兩次密碼輸入不一致');
        }else{
            $('#check-pwd-tip').html('');
        }
    });

    $('#reg-acc').on('keyup', function(event){
        let acc = $(this).val();
        if(acc.indexOf('@') == -1){
            $('#acc-tip').html('信箱格式不正確');
        }else{
            $('#acc-tip').html('');
        }
    });

    $('#admin-login').on('click', function(event){
        let acc = $('#admin-acc').val();
        let pwd = $('#admin-pwd').val();

        if(acc.length == 0){
            $('#login-acc-tip').html('請輸入帳號');
            return;
        }else{
            $('#login-acc-tip').html('');
        }

        if(pwd.length == 0){
            $('#login-pwd-tip').html('請輸入密碼');
            return;
        }else{
            $('#login-pwd-tip').html('');
        }


        $.ajax({
            // ex:/專案名/資料夾名/檔案名
            url: "/",
            type: "POST",
            // dataType: 'json',
            data: {'acc':acc,'pwd':pwd},
            success: function(data) {
                if(data['res']=='success'){
                    alert('登入成功');
                    window.location.replace('LaptopShoppingSiteFront/templates/backstage.html'); //跳轉頁面
                }
                else{
                    alert(data['msg']);
                }
            },
            error: function(jqXHR) {
                alert(jqXHR.statusText);
                alert(jqXHR.responseText);
            }
        });
    });

});
