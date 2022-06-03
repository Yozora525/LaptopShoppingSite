$(function() {
    $('#minus').on('click', function(event){
        if ((parseInt($('#quan').val())-1) < 1) {
            $('#quan').val(1);
        }else{
            $('#quan').val(parseInt($('#quan').val())-1);
        }
    });

    $('#plus').on('click', function(event){
        if ((parseInt($('#quan').val())+1) >= (parseInt($('#inventory').text()))) {
            $('#quan').val($('#inventory').text());
        }else{
            $('#quan').val(parseInt($('#quan').val())+1);
        }
        
    });

    $('#quan').on('keyup', function(event){
        if ($('#quan').val().length == 0) {
            $('#quan').val(1);
        }
        if(parseInt($('#quan').val()) > (parseInt($('#inventory').text()))){
            $('#quan').val($('#inventory').text());
        }
        $('#quan').val(parseInt($('#quan').val())); // 避免使用者在數量前打0
    });

    $('img[name="img-list"]').on('click', function(){
        $('#img-show').attr('src', $(this).attr('src'));
    });

    $('img[name="img-list"]').on('mouseenter', function(){
        $('#img-show').attr('src', $(this).attr('src'));
    });
});