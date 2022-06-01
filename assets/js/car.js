$(function() {
    $('#all-check').on('change', function(event){

       if ($('#all-check').prop('checked')) {
           $('input[name="item-check"]').prop('checked', true);
       }else{
        $('input[name="item-check"]').prop('checked', false);
       }
       $('input[name="item-check"]').change();
    });

    $('input[name="item-quan"').on('change', function(event){
        let index = $('input[name="item-quan"').index(this);
        let sum = parseInt($($('input[name="item-price"]')[index]).val()) * parseInt($(this).val());
        let item = $($('input[name="item-name"]')[index]).val();
        // $($('span[name="item-sum"]')[index]).html(sum);
        // $('span[name="item-sum"]').change();
        $.blockUI({
            message: $("#loading"),
            css: {
                "border": "none",
                "backgroundColor": "rgba(0,0,0,0)",
                "backgroundImage": "url('LaptopShoppingSiteFront/assets/img/loading.gif')",
                "backgroundSize": "100%",
                
            }
        });

        $.ajax({
            url: "/",
            type: "POST",
            // dataType: 'json',
            data: {'product':item,'quan':$(this).val(),'sum':sum},
            success: function(data) {
                if(data['res']=='success'){
                    $($('span[name="item-sum"]')[index]).html(sum);
                    $('span[name="item-sum"]').change();
                    $.unblockUI();
                }
                else{
                    alert(data['msg']);
                    $.unblockUI();
                    // alert('發生錯誤，請稍後再試');
                    location.reload();
                }
            },
            error: function(jqXHR) {
                alert(jqXHR.statusText);
                alert(jqXHR.responseText);
            }
        });
    });

    $('input[name="item-check"]').on('change', function(event){
        let n = $('input[name="item-check"]').length;
        var total = 0;

        for (let index = 0; index < n; index++) {
            if($($('input[name="item-check"]')[index]).prop('checked')) {
                total += parseInt($($('span[name="item-sum"]')[index]).text());
            }
        }

        $('#car-pay-total').html(total);
    });

    $('span[name="item-sum"]').on('change', function(event){
        let n = $('input[name="item-check"]').length;
        var total = 0;

        for (let index = 0; index < n; index++) {
            if($($('input[name="item-check"]')[index]).prop('checked')) {
                total += parseInt($($('span[name="item-sum"]')[index]).text());
            }
        }

        $('#car-pay-total').html(total);
    });

    $('span[name="item-delete"]').on('click', function(event){
        let index = $('span[name="item-delete"]').index(this);
        let item = $($('input[name="item-name"]')[index]).val();
        // $($('div[name="car-item"]')[index]).remove();

        $.confirm({
            title: '移除商品',
            animation: 'zoom',
            closeAnimation: 'scale',
            content: '確定要將'+ item + '從購物車內移除嗎？',
            buttons: {
              確認: function() {
                $.ajax({
                    url: "/",
                    type: "POST",
                    // dataType: 'json',
                    data: {'product':item},
                    success: function(data) {
                        if(data['res']=='success'){
                            alert('刪除成功');
                            $($('div[name="car-item"]')[index]).remove();
                            location.reload();
                        }
                        else{
                            alert(data['msg']);
                            // alert('發生錯誤，請稍後再試');
                            location.reload();
                        }
                    },
                    error: function(jqXHR) {
                        alert(jqXHR.statusText);
                        alert(jqXHR.responseText);
                    }
                });
              },
              取消: function() {
              }
            }
          });
    })

});