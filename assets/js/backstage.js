$(function(){
    $('button[name="switch"]').on('click', function(event){
        let index = $('button[name="switch"]').index(this);
        let status = $($('span[name="pro-status"]')[index]).text();
        let pro = $($('span[name="pro-name"]')[index]).text();
        var statusAfter = ''
        

        if(status == "上架"){
            statusAfter = '下架';
        }else{
            statusAfter = '上架';
        }

        $.confirm({
            title: '修改產品狀態',
            animation: 'zoom',
            closeAnimation: 'scale',
            content: '確定要將'+ pro + '的狀態改為'+ statusAfter +'嗎？',
            buttons: {
              確認: function() {
                $.ajax({
                    url: "/",
                    type: "POST",
                    // dataType: 'json',
                    data: {'product':pro,'status':status},
                    success: function(data) {
                        if(data['res']=='success'){
                            if(status == "上架"){
                                $(this).text('上架');
                                $($('span[name="pro-status"]')[index]).text('下架');
                            }else{
                                $(this).text('下架');
                                $($('span[name="pro-status"]')[index]).text('上架');
                            }
        
                        }else{
                            alert(data['msg']);
                            // alert('發生錯誤，請稍後再試');
                            // location.reload();
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
    });

    $('#pro-table-title').on('click', function(event){
        $('#pro-table').slideToggle();
    });

    $('#trans-table-title').on('click', function(event){
        $('#trans-filter').slideToggle();
        $('#trans-table').slideToggle();
    });

    $('#add-pro').on('click', function(event){

    });

});