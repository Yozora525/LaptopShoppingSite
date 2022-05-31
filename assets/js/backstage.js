$(function(){
    $('button[name="switch"]').on('click', function(event){
        let index = $('button[name="switch"]').index(this);
        let status = $($('span[name="pro-status"]')[index]).text();
        let pro = $($('span[name="pro-name"]')[index]).text();

        // if(status == "上架"){
        //     $(this).text('上架');
        //     $($('span[name="pro-status"]')[index]).text('下架');
        // }else{
        //     $(this).text('下架');
        //     $($('span[name="pro-status"]')[index]).text('上架');
        // }

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
    });

    $('#pro-table-title').on('click', function(event){
        $('#pro-table').slideToggle();
    });

    $('#trans-table-title').on('click', function(event){
        $('#trans-filter').slideToggle();
        $('#trans-table').slideToggle();
    })
});