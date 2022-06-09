$(function(){
    $('#change-pwd').prop('disabled', true);

    $('#pwd').on('keyup', function(event){
        let pwd = $(this).val();
        let check_pwd = $('#check-pwd').val();
        let reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;

        if (reg.test(pwd)) {
            $('#pwd-tip').html('');
        }else{
            $('#pwd-tip').html('密碼長度須為8-16，大小寫英數混合');
        }

        if(pwd != check_pwd){
            $('#check-pwd-tip').html('兩次密碼輸入不一致');
            $('#change-pwd').prop('disabled', true);
        }else{
            $('#check-pwd-tip').html('');
            $('#change-pwd').prop('disabled', false);
        }
        
    });

    $('#check-pwd').on('keyup', function(event){
        let pwd = $('#pwd').val();
        let check_pwd = $(this).val();

        if(pwd != check_pwd){
            $('#check-pwd-tip').html('兩次密碼輸入不一致');
            $('#change-pwd').prop('disabled', true);
        }else{
            $('#check-pwd-tip').html('');
            $('#change-pwd').prop('disabled', false);
        }
    });


});
